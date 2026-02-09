using { logicalstar.is.utils as utils } from '../db/schema';


service JobService @(path: 'job-service') {
    entity MonitoredFlows as projection on utils.MonitoredFlows;
}