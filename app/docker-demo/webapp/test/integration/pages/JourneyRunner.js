sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"logicalstar/dockerdemo/test/integration/pages/MonitoredFlowsList",
	"logicalstar/dockerdemo/test/integration/pages/MonitoredFlowsObjectPage"
], function (JourneyRunner, MonitoredFlowsList, MonitoredFlowsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('logicalstar/dockerdemo') + '/test/flp.html#app-preview',
        pages: {
			onTheMonitoredFlowsList: MonitoredFlowsList,
			onTheMonitoredFlowsObjectPage: MonitoredFlowsObjectPage
        },
        async: true
    });

    return runner;
});

