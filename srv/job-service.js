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
        'ScriptCollectionDesigntimeArtifacts',
        'MessageMappingDesigntimeArtifacts',
        'ValueMappingDesigntimeArtifacts'
    ], async (req) => {
        try {
            console.log(`Reading ${req.target.name} from Integration Suite...`);
            
            // Forward the request to the external service
            return await integrationService.run(req.query);
            
        } catch (error) {
            console.error('Error reading from Integration Suite:', error);
            req.error(500, `Failed to fetch data from Integration Suite: ${error.message}`);
        }
    });

    // Optional: Add custom logic for specific entities if needed
    this.on('READ', 'Packages', async (req) => {
        try {
            console.log('Fetching Integration Packages...');
            
            // You can add custom filtering, transformation, or caching here
            const result = await integrationService.run(req.query);
            
            // Example: Add custom logic or data transformation
            return result;
            
        } catch (error) {
            console.error('Error fetching packages:', error);
            req.error(500, `Failed to fetch packages: ${error.message}`);
        }
    });
    
});