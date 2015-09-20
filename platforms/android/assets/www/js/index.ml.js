(function() {var bindEvents;bindEvents = (function () {return      document['addEventListener']('deviceready', onDeviceReady, false)
});

var onDeviceReady;onDeviceReady = (function () {return      receivedEvent('deviceready')
});

var receivedEvent;receivedEvent = (function () {
    var id;id = arguments[0];
    var parentElement;parentElement = document['getElementById'](id);
    var listeningElement;listeningElement = parentElement['querySelector']('.listening');
    var receivedElement;receivedElement = parentElement['querySelector']('.received');

    listeningElement['setAttribute']('style', 'display:none;');
    receivedElement['setAttribute']('style', 'display:block;'); return       console['log']('Received Event: '.__add(id))
}); return   bindEvents()
}).exports(typeof module !== 'undefined' ? module : null)()
