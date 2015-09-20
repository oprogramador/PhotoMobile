$takePhoto = {
    $onSuccess = {
        $imageData = this;
        $image = document.getElementById('myImage');
        image.src = "data:image/jpeg;base64," + imageData
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

$bindEvents = {
    eval('$')('#photoButton').click({
        takePhoto()
    })
};

bindEvents()
