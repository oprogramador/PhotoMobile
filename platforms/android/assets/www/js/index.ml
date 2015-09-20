$bindEvents = {
    document['addEventListener']('deviceready', onDeviceReady, false)
};

$onDeviceReady = {
    receivedEvent('deviceready')
};

$receivedEvent = {
    $id = this;
    $parentElement = document['getElementById'](id);
    $listeningElement = parentElement['querySelector']('.listening');
    $receivedElement = parentElement['querySelector']('.received');

    listeningElement['setAttribute']('style', 'display:none;');
    receivedElement['setAttribute']('style', 'display:block;');

    console['log']('Received Event: '+id)
};

bindEvents()
