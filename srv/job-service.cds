using { logicalstar.is.utils as utils } from '../db/schema';
using { IntegrationContent as content } from '../srv/external/IntegrationContent';


service JobService @(path: 'job-service') {
    entity MonitoredFlows as projection on utils.MonitoredFlows;
    @read.only entity IntegrationPackages as projection on content.IntegrationPackages ; 
    @read.only entity IntegrationDesigntimeArtifacts as projection on content.IntegrationDesigntimeArtifacts ;
    @read.only entity IntegrationRuntimeArtifacts as projection on content.IntegrationRuntimeArtifacts ;
}