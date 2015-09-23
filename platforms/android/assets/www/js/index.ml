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

$deletePhotoFromStorage = {
    $photos = localStorage['photos'].fromJson;
    photos.remove(this);
    localStorage['photos'] = photos.jsonStr
};

$getPhotoId = {
    'img-'+this
};

$showPhoto = {
    eval('$')('#showPhoto').show();
    eval('$')('#showPhoto [name=photo]').html('<img name="'+this+'" src="'+eval('$')('#'+getPhotoId(this)).attr('src')+'">')
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

$closePhoto = {
    eval('$')('#showPhoto').hide()
};

$deletePhoto = {
    $key = eval('$')('#showPhoto img').attr('name');
    console.log('key='+key);
    $elem = eval('$')('#'+getPhotoId(key)).get(0);
    elem['parentElement'].removeChild(elem);
    eval('$')('#showPhoto').hide();
    deletePhotoFromStorage(key)
};

$bindEvents = {
    eval('$')('#photoButton').click({
        takePhoto()
    });
    eval('$')('#showPhoto [name=close]').click(closePhoto);
    eval('$')('#showPhoto [name=delete]').click(deletePhoto)
};

$init = {
    bindEvents();
    drawPhotos()
};

init()
