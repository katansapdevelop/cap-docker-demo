sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'logicalstar.dockerdemo',
            componentId: 'MonitoredFlowsList',
            contextPath: '/MonitoredFlows'
        },
        CustomPageDefinitions
    );
});