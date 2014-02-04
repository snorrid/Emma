(function(){
    var cordovaRef = window.PhoneGap || window.cordova || window.Cordova;

    function emma() { }

    // initialize emma analytics with an account ID
    //
    // id = the eMMa account ID
    emma.prototype.startSession = function(id, success, fail, context) {
        return cordovaRef.exec(success, fail, 'emma', 'startSession', [id]);
    };
    emma.prototype.loginUserID = function(customerId, mail, extras, success, fail) {
        return cordovaRef.exec(success, fail, 'emma', 'loginUserID', [customerId, mail, extras]);
    };
    emma.prototype.startOrder = function(orderId, customerId, price, success, fail) {
        return cordovaRef.exec(success, fail, 'emma', 'startOrder', [orderId, customerId, price]);
    };
    emma.prototype.addProduct = function(productId, name, qty, price, extras, success, fail) {
        return cordovaRef.exec(success, fail, 'emma', 'addProduct', [productId, name, qty, price, extras]);
    };
    emma.prototype.trackOrder = function(success, fail) {
        return cordovaRef.exec(success, fail, 'emma', 'trackOrder', []);
    };
    emma.prototype.startPushSystem = function(success, fail) {
        return cordovaRef.exec(success, fail, 'emma', 'startPushSystem', []);
    };

    if (cordovaRef && cordovaRef.addConstructor) {
        cordovaRef.addConstructor(init);
    }
    else {
        init();
    }

    function init () {
        if(!window.plugins) {
            window.plugins = {};
        }
        if(!window.plugins.emma) {
            window.plugins.emma = new emma();
        }
    }

    if (typeof module != 'undefined' && module.exports) {
        module.exports = new emma();
    }
})(); /* End of Temporary Scope. */