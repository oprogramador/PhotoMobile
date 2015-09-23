(function() {var takePhoto;takePhoto = (function () {
    var onSuccess;onSuccess = (function () {
        appendPhotoToDraw(arguments[0]); return          savePhoto(arguments[0])
    });

    var onFail;onFail = (function () {
        var message;message = arguments[0]; return          alert('Failed because: ' .__add( message))
    }); return       navigator['camera'].getPicture(onSuccess, onFail, new AssocArray([
        'quality', (50),
        'destinationType', Camera['DestinationType']['DATA_URL']
    ]))
});

var savePhoto;savePhoto = (function () {
    var photos;photos = localStorage['photos'].fromJson();
    photos[(20).randStr()] = arguments[0]; return      localStorage['photos'] = photos.jsonStr()
});

var appendPhotoToDraw;appendPhotoToDraw = (function () {return      eval('$')('#photos').append('<img src="data:image/jpeg;base64,'.__add(arguments[0]).__add('"/>'))
});

var getAllPhotos;getAllPhotos = (function () {
    (function () {return !localStorage.has('photos')}).if((function () {return          localStorage['photos'] = new AssocArray([]).jsonStr()
    })); return      localStorage['photos'].fromJson()
});

var drawPhotos;drawPhotos = (function () {
    var photos;photos = getAllPhotos(); return      photos.keys().each((function () {return          appendPhotoToDraw(photos[arguments[0]])
    }))
});

var bindEvents;bindEvents = (function () {return      eval('$')('#photoButton').click((function () {return          takePhoto()
    }))
});

var init;init = (function () {
    bindEvents(); return      drawPhotos()
}); return   init()
})()
