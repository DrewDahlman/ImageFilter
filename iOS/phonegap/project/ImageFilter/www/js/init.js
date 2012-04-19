// PROJECT: ImageFilter Phonegap Plugin
// AUTHOR: Drew Dahlman (www.drewdahlman.com)
// DATE: 2.25.2012
// VERSION: 1.0
/*
NOTES:
A few things to read before using this plugin.
Each filter is created with objective-c. Thus modifications to effects must be made there.
Applying a filter is simple - 

EXAMPLE:
plugins.ImageFilter.stark({
    image:imageURI,
    save:'false'
});
 
*/

// GLOBAL VARS
var largeImage;

var app = {
    bodyLoad: function () {
        document.addEventListener("deviceready", app.deviceReady, false);
    },
    deviceReady: function () {
        app.init();
    },
    init: function () {
		
    },
    useCamera: function () {
        navigator.camera.getPicture(app.onCameraSuccess, app.onCameraFail, {
            quality: 100,
            destinationType: Camera.DestinationType.FILE_URI,
            sourceType: Camera.PictureSourceType.CAMERA,
            //allowEdit : true,
            encodingType: Camera.EncodingType.JPEG,
            targetWidth: 910,
            targetHeight: 910,
            saveToPhotoAlbum: false
        });
    },
    useRoll: function () {
        navigator.camera.getPicture(app.onCameraSuccess, app.onCameraFail, {
            quality: 100,
            destinationType: Camera.DestinationType.FILE_URI,
            sourceType: Camera.PictureSourceType.PHOTOLIBRARY,
            encodingType: Camera.EncodingType.JPEG,
            targetWidth: 910,
            targetHeight: 910,
            saveToPhotoAlbum: false
        });
    },
    onCameraSuccess: function (imageURI) {
		plugins.ImageFilter.clean();
		largeImage = imageURI;
        filters.pinhole();
		$(".photo").html("<img src='" + imageURI + "'>");
		$(".photo").show();
		
    },
    onCameraFail: function (msg) {
        console.log("ERROR! -" + msg);
    }
};

var filters = {
    none: function (imageURI) {
        plugins.ImageFilter.none(filters.rendered, {
            image: imageURI,
            save: 'false',
        });
    },
    sunnySide: function (imageURI) {
        plugins.ImageFilter.sunnySide(filters.rendered, {
            image: imageURI,
            save: 'false'
        });
    },
    worn: function (imageURI) {
        plugins.ImageFilter.worn(filters.rendered, {
            image: imageURI,
            save: 'false'
        });
    },
    vintage: function (imageURI) {
        plugins.ImageFilter.vintage(filters.rendered, {
            image: imageURI,
            save: 'false'
        });
    },
    stark: function (imageURI) {
        plugins.ImageFilter.stark(filters.rendered, {
            image: imageURI,
            save: 'false'
        });
    },
    rendered: function (msg) {
		
        $(".photo").html("<img src='" + msg + "'>");
    }
}