(function(){
	var cordovaRef = window.PhoneGap || window.cordova || window.Cordova;

	function emma() { }

	// initialize emma analytics with an account ID
	//
	// id = the eMMa account ID
    emma.prototype.status = '';
	emma.prototype.startSession = function(id, success, fail, context) {
        var self = this;
        var _success = function(e){
            self.status = e;
            if(success && context && typeof success == 'function' && typeof context == 'object'){
                success.call(self,e);
            }
            else if(success && typeof success == 'function'){
                success(e);
            }
        };
        var _fail = function(e){
            self.status = e;
            if(fail && context && typeof fail == 'function' && typeof context == 'object'){
                fail.call(self,e);
            }
            else if(fail && typeof fail == 'function'){
                fail(e);
            }
        };
		return cordovaRef.exec(_success, _fail, 'emma', 'startSession', [id]);
	};
	emma.prototype.startOrder = function(orderId, customerId, success, fail) {
		return cordovaRef.exec(success, fail, 'emma', 'startOrder', [orderId, customerId]);
	};
	emma.prototype.addProduct = function(productId, name, qty, price, extras, success, fail) {
		return cordovaRef.exec(success, fail, 'emma', 'addProduct', [productId, name, qty, price, extras]);
	};
	emma.prototype.trackOrder = function(success, fail) {
		return cordovaRef.exec(success, fail, 'emma', 'trackOrder');
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