/*
 Copyright (c) 2012 Drew Dahlman
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
PhoneGap.addConstructor(function () {
    if(!window.plugins) {
        window.plugins = {};
    }
    window.plugins.ImageFilter = new ImageFilter();
});