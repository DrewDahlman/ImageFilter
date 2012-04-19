/*
Copyright (c) 2012 Drew Dahlman MIT LICENSE
*/

var ImageFilter = function () {};

ImageFilter.prototype.clean = function (options) {

    cordova.exec("ImageFilter.clean");
};
ImageFilter.prototype.none = function (done,options) {
    //console.log(options+" "+done);
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }

    return cordova.exec(done,null,"ImageFilter","none",[defaults]);
};
ImageFilter.prototype.sunnySide = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return cordova.exec(done,null,"ImageFilter","sunnySide",[defaults]);
};
ImageFilter.prototype.worn = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
   	return cordova.exec(done,null,"ImageFilter","worn",[defaults]);
};
ImageFilter.prototype.vintage = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return cordova.exec(done,null,"ImageFilter","vintage",[defaults]);
};
ImageFilter.prototype.stark = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return cordova.exec(done,null,"ImageFilter","stark",[defaults]);
};
PhoneGap.addConstructor(function () {
    if(!window.plugins) {
        window.plugins = {};
    }
    window.plugins.ImageFilter = new ImageFilter();
});