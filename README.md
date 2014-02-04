# emma

> Emma Analytics plugin for iOS and Android. This allows you to post usage information to your Emma Analytics account.

## Preparation:
Before you can begin collecting metrics data, you need to set up a eMMa account so you can view them. When you do so, you will obtain an app tracking id which we'll use during session initialization. Start by going to the [eMMa](http://emmasolutions.net/sign-up/) fill all required fields and click on the **SIGN UP** button.

## Installation:

### local

To install it to your phonegap app use phonegap-cli 3.0 or newer,
simply execute as follows;

	phonegap local plugin add https://github.com/kredito/Emma

## Usage
The plugin creates the object window.emma

After onDeviceReady, call plugin so:

	emma.startSession(key, success, fail); /*where key is string*/

To login user:

    emma.loginUserID(customerId, mail, extras, success, fail); /*where customerId and mail is string and extras is simple js object*/

To start order:

    emma.startOrder(orderId, customerId, price, success, fail); /*where orderId and customerId is string and price is float or int number in string representation*/

To add new product:

    emma.addProduct(productId, name, qty, price, extras, success, fail); /*where customerId and mail is string and extras is simple js object*/

To track order:

    emma.trackOrder(success, fail); /*where success and fail are callback functions*/

To init push notifications:

    emma.startPushSystem(success, fail);