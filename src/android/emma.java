package com.kreditech.plugins;

import android.os.Looper;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

import com.emma.android.eMMa;

public class emma extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (action.equals("startSession")) {
            final String key = args.getString(0);
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    Looper.prepare();
                    try {
                        eMMa.starteMMaSession(cordova.getActivity(),key);
                        callbackContext.success("startSession: id=" + key);
                    } catch (final Exception e) {
                        callbackContext.error(e.getMessage());
                    }
                }
            });
            return true;
        }
	    else if (action.equals("startOrder")) {
		    final String orderId = args.getString(0);
	        final String customerId = args.getString(1);
	        final Float totalPrice = Float.valueOf(args.getString(2));
		    cordova.getThreadPool().execute(new Runnable() {
			    public void run() {
                    try {
                        eMMa.startOrder(cordova.getActivity(), orderId, customerId, totalPrice);
                        callbackContext.success("startOrder: orderId=" + orderId + ", customerId=" + customerId + " totalPrice=" + totalPrice);
                    } catch (final Exception e) {
                        callbackContext.error(e.getMessage());
                    }
                }
            });
            return true;
        } else if (action.equals("addProduct")) {
            final String productId = args.getString(0);
            final String name = args.getString(1);
            final Float qty = Float.valueOf(args.getString(2));
            final Float price = Float.valueOf(args.getString(3));
            final JSONObject extrasRaw = args.getJSONObject(4);
            final Iterator<String> extrasItr = extrasRaw.keys();
            final Map<String, String> extras = new HashMap<String, String>();
            while (extrasItr.hasNext()) {
                String key = extrasItr.next();
                extras.put(key, extrasRaw.getString(key));
            }
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    try {
                        eMMa.addProduct(productId, name, qty, price, extras);
                        callbackContext.success("addProduct: productId=" + productId + ", name=" + name + " qty=" + qty);
                    } catch (final Exception e) {
                        callbackContext.error(e.getMessage());
                    }
                }
            });
            return true;
        } else if (action.equals("trackOrder")) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    try {
                        eMMa.trackOrder(cordova.getActivity());
                        callbackContext.success("trackOrder: order tracked!");
                    } catch (final Exception e) {
                        callbackContext.error(e.getMessage());
                    }
                }
            });
            return true;
        }
        return false;
    }
}