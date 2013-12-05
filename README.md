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

After onDeviceReady, call plugin so;

	emma.startSession(key, sucessCallback, errorCallback, context)