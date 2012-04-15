var ImageFilter = function () {};

ImageFilter.prototype.clean = function (options) {
    
    PhoneGap.exec("ImageFilter.clean");
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
    
    return PhoneGap.exec(done,null,"ImageFilter","none",[defaults]);
};
ImageFilter.prototype.sunnySide = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return PhoneGap.exec(done,null,"ImageFilter","sunnySide",[defaults]);
};
ImageFilter.prototype.worn = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
   	return PhoneGap.exec(done,null,"ImageFilter","worn",[defaults]);
};
ImageFilter.prototype.vintage = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return PhoneGap.exec(done,null,"ImageFilter","vintage",[defaults]);
};
ImageFilter.prototype.stark = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return PhoneGap.exec(done,null,"ImageFilter","stark",[defaults]);
};
ImageFilter.prototype.pinhole = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return PhoneGap.exec(done,null,"ImageFilter","pinhole",[defaults]);
};
ImageFilter.prototype.summer = function (done,options) {
    var defaults = {
        image: '',
        save: '',
    };
    for(var key in defaults) {
        if(typeof options[key] !== "undefined") defaults[key] = options[key];
    }
    return PhoneGap.exec(done,null,"ImageFilter","summer",[defaults]);
};
PhoneGap.addConstructor(function() {
	PhoneGap.addPlugin("ImageFilter", new ImageFilter());
});