using {JobService} from './job-service';

annotate JobService with @(requires: 'authenticated-user');


annotate JobService.MonitoredFlows with @(restrict: [
    { grant: 'READ', to: ['monitor']}, 
    { grant: '*', to: ['configure']}
]);

