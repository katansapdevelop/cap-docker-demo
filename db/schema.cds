using { cuid, managed } from '@sap/cds/common';
namespace logicalstar.is.utils;



entity MonitoredFlows: managed, cuid {
  iflow_id : String;
}