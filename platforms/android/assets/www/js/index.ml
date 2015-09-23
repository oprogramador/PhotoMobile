$takePhoto = {
    $onSuccess = {
        $key = 20.randStr;
        appendPhotoToDraw(key, this);
        savePhoto(key, this)
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
    photos[this] = first;
    localStorage['photos'] = photos.jsonStr
};

$getPhotoId = {
    'img-'+this
};

$showPhoto = {
    eval('$')('#showPhoto').show();
    eval('$')('#showPhoto [name=photo]').html('<img src="'+eval('$')('#'+getPhotoId(this)).attr('src')+'">')
};

$appendPhotoToDraw = {
    eval('$')('#photos').append('<img name="'+this+'"id="'+getPhotoId(this)+'" src="data:image/jpeg;base64,'+first+'"/>');
    $that = this;
    eval('$')('#'+getPhotoId(this)).click({
        showPhoto(that)
    })
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
        appendPhotoToDraw(this, photos[this])
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
