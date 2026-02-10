using { logicalstar.is.utils as utils } from '../db/schema';
using { IntegrationContent as content } from '../srv/external/IntegrationContent';


service JobService @(path: 'job-service') {
    entity MonitoredFlows as projection on utils.MonitoredFlows;
    @read.only entity Packages as projection on content.IntegrationPackages ; 
}