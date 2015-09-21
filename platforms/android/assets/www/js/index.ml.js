(function() {var takePhoto;takePhoto = (function () {
    var onSuccess;onSuccess = (function () {
        var image;image = document.getElementById('myImage');
        var imageData;imageData = arguments[0];
        var photos;photos = localStorage['photos'].fromJson();
        photos[(20).randStr()] = imageData;
        localStorage['photos'] = photos.jsonStr(); return          image['src'] = "data:image/jpeg;base64," .__add( imageData
    )});

    var onFail;onFail = (function () {
        var message;message = arguments[0]; return          alert('Failed because: ' .__add( message))
    }); return       navigator['camera'].getPicture(onSuccess, onFail, new AssocArray([
        'quality', (50),
        'destinationType', Camera['DestinationType']['DATA_URL']
    ]))
});

var drawPhotos;drawPhotos = (function () {
    (function () {return !localStorage.has('photos')}).if((function () {return          localStorage['photos'] = new AssocArray([]).jsonStr()
    }));
    var photos;photos = localStorage['photos'].fromJson();
    console.log('photos='.__add(photos.keys())); return      photos.keys().each((function () {return          eval('$')('#photos').append('<img src="data:image/jpeg;base64,'.__add(photos[arguments[0]]).__add('"/>'))
    }))
});

var bindEvents;bindEvents = (function () {return      eval('$')('#photoButton').click((function () {return          takePhoto()
    }))
});

var init;init = (function () {
    bindEvents(); return      drawPhotos()
}); return   init()
})()
