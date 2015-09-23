$takePhoto = {
    $onSuccess = {
        appendPhotoToDraw(this);
        savePhoto(this)
    };

    $onFail = {
        $message = this;
        alert('Failed because: ' + message)
    };

    navigator['camera'].getPicture(onSuccess, onFail, %(
        'quality': 50,
        'destinationType': Camera['DestinationType']['DATA_URL']
    ))
};

$savePhoto = {
    $photos = localStorage['photos'].fromJson;
    photos[20.randStr] = this;
    localStorage['photos'] = photos.jsonStr
};

$appendPhotoToDraw = {
    eval('$')('#photos').append('<img src="data:image/jpeg;base64,'+this+'"/>')
};

$getAllPhotos = {
    {!localStorage.has('photos')}.if({
        localStorage['photos'] = %().jsonStr
    });
    localStorage['photos'].fromJson
};

$drawPhotos = {
    $photos = getAllPhotos();
    photos.keys.each({
        appendPhotoToDraw(photos[this])
    })
};

$bindEvents = {
    eval('$')('#photoButton').click({
        takePhoto()
    })
};

$init = {
    bindEvents();
    drawPhotos()
};

init()
