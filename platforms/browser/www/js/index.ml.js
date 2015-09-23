(function() {var takePhoto;takePhoto = (function () {
    var onSuccess;onSuccess = (function () {
        var key;key = (20).randStr();
        appendPhotoToDraw(key, arguments[0]); return          savePhoto(key, arguments[0])
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
    photos[arguments[0]] = arguments[1]; return      localStorage['photos'] = photos.jsonStr()
});

var getPhotoId;getPhotoId = (function () {return      'img-'.__add(arguments[0]
)});

var showPhoto;showPhoto = (function () {return      alert(arguments[0])
});

var appendPhotoToDraw;appendPhotoToDraw = (function () {
    eval('$')('#photos').append('<img name="'.__add(arguments[0]).__add('"id="').__add(getPhotoId(arguments[0])).__add('" src="data:image/jpeg;base64,').__add(arguments[1]).__add('"/>'));
    var that;that = arguments[0]; return      eval('$')('#'.__add(getPhotoId(arguments[0]))).click((function () {return          showPhoto(that)
    }))
});

var getAllPhotos;getAllPhotos = (function () {
    (function () {return !localStorage.has('photos')}).if((function () {return          localStorage['photos'] = new AssocArray([]).jsonStr()
    })); return      localStorage['photos'].fromJson()
});

var drawPhotos;drawPhotos = (function () {
    var photos;photos = getAllPhotos(); return      photos.keys().each((function () {return          appendPhotoToDraw(arguments[0], photos[arguments[0]])
    }))
});

var bindEvents;bindEvents = (function () {return      eval('$')('#photoButton').click((function () {return          takePhoto()
    }))
});

var init;init = (function () {
    bindEvents(); return      drawPhotos()
}); return   init()
})()
