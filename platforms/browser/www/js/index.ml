$takePhoto = {
    $onSuccess = {
        $image = document.getElementById('myImage');
        $imageData = this;
        $photos = localStorage['photos'].fromJson;
        photos[20.randStr] = imageData;
        localStorage['photos'] = photos.jsonStr;
        image['src'] = "data:image/jpeg;base64," + imageData
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

$drawPhotos = {
    {!localStorage.has('photos')}.if({
        localStorage['photos'] = %().jsonStr
    });
    $photos = localStorage['photos'].fromJson;
    console.log('photos='+photos.keys);
    photos.keys.each({
        eval('$')('#photos').append('<img src="data:image/jpeg;base64,'+photos[this]+'"/>')
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
