//
//  emma.h
//  emma
//

#import <Cordova/CDV.h>
#import "AppDelegate.h"
#import "eMMa.h"

@interface emma : CDVPlugin

@end

@implementation emma
{
	NSDictionary *launchOptions;
}

- (void)pluginInitialize
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

-(void)didFinishLaunching:(NSNotification*)notification {
	launchOptions = notification.userInfo;
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *) deviceToken { 	[eMMa registerToken:deviceToken]; }

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
	[eMMa checkReceivedNotifications:userInfo];
}


- (void) startSession:(CDVInvokedUrlCommand*)command
{
    NSString    *callbackId = command.callbackId;
    NSString    *accountID = [command.arguments objectAtIndex:0];

	@try {
        [eMMa starteMMaSession:accountID];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa startSession successful"] callbackId:callbackId];
    }
    @catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
    }
}
- (void) loginUserID:(CDVInvokedUrlCommand*)command
{
	NSString    *callbackId = command.callbackId;
	NSString    *customerID = [command.arguments objectAtIndex:0];
	NSString    *mail = [command.arguments objectAtIndex:1];
	NSDictionary *extras = [command.arguments objectAtIndex:2];
	
	@try {
		[eMMa loginUserID:customerID forMail:mail andExtras:extras];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa loginUserID successful"] callbackId:callbackId];
	}
	@catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
	}
}
- (void) startOrder:(CDVInvokedUrlCommand*)command
{
	NSString    *callbackId = command.callbackId;
	NSString    *orderID = [command.arguments objectAtIndex:0];
	NSString    *customerID = [command.arguments objectAtIndex:1];
	float    totalPrice = [[command.arguments objectAtIndex:2] floatValue];
		
	@try {
		[eMMa startOrder:orderID customerId:customerID totalPrice:totalPrice];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa startOrder successful"] callbackId:callbackId];
	}
	@catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
	}
}
- (void) addProduct:(CDVInvokedUrlCommand*)command
{
	NSString    *callbackId = command.callbackId;
	NSString    *productId = [command.arguments objectAtIndex:0];
	NSString    *name = [command.arguments objectAtIndex:1];
	float    qty = [[command.arguments objectAtIndex:2] floatValue];
	float    price = [[command.arguments objectAtIndex:3] floatValue];
	NSDictionary *extras = [command.arguments objectAtIndex:4];
			
	@try {
		[eMMa addProduct:productId name:name qty:qty price:price extras:extras];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa addOrder successful"] callbackId:callbackId];
	}
	@catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
	}
}
- (void) trackOrder:(CDVInvokedUrlCommand*)command
{
	NSString    *callbackId = command.callbackId;
	
	@try {
		[eMMa trackOrder];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa trackOrder successful"] callbackId:callbackId];
	}
	@catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
	}
}
- (void) startPushSystem:(CDVInvokedUrlCommand*)command
{
	NSString    *callbackId = command.callbackId;
	
	@try {
		[eMMa startPushSystem:launchOptions withDelegate:[self appDelegate]];
		[self success:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"eMMa startPushSystem successful"] callbackId:callbackId];
	}
	@catch (NSException *exception) {
		[self error:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception description]] callbackId:callbackId];
	}
}

@end