(function() {var takePhoto;takePhoto = (function () {
    var onSuccess;onSuccess = (function () {
        var image;image = document.getElementById('myImage');
        var imageData;imageData = arguments[0]; return          image['src'] = "data:image/jpeg;base64," .__add( imageData
    )});

    var onFail;onFail = (function () {
        var message;message = arguments[0]; return          alert('Failed because: ' .__add( message))
    }); return       navigator['camera'].getPicture(onSuccess, onFail, new AssocArray([
        'quality', (50),
        'destinationType', Camera['DestinationType']['DATA_URL']
    ]))
});

var bindEvents;bindEvents = (function () {return      eval('$')('#photoButton').click((function () {return          takePhoto()
    }))
}); return   bindEvents()
})()
