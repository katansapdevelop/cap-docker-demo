const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { IntegrationContent } = this.entities;
    
    // Connect to the external Integration Suite service
    const integrationService = await cds.connect.to('IntegrationContent');
    
    // Handler for all entities with @cds.persistence.skip
    this.on('READ', [
        'Packages',
        'IntegrationPackages', 
        'IntegrationDesigntimeArtifacts',
        'IntegrationRuntimeArtifacts',
        'ScriptCollectionDesigntimeArtifacts',
        'MessageMappingDesigntimeArtifacts',
        'ValueMappingDesigntimeArtifacts'
    ], async (req) => {
        try {
            console.log(`Reading ${req.target.name} from Integration Suite...`);
            
            // Create a new query that selects all entities and only supports $top and $skip
            const newQuery = SELECT.from(req.target);
            
            // Only add $top and $skip if they exist in the original query
            if (req.query.SELECT && req.query.SELECT.limit) {
                newQuery.limit(req.query.SELECT.limit.rows, req.query.SELECT.limit.offset || 0);
            }
            
            // Had to use this style as the OData Service in IS does not implement functions like $select, $filter, etc. and the cds client does not allow to ignore unsupported query options
            return await integrationService.send('GET',req.context.http.req.url); 
            
            
        } catch (error) {
            console.error('Error reading from Integration Suite:', error);
            req.error(500, `Failed to fetch data from Integration Suite: ${error.message}`);
        }
    });

  
    
});