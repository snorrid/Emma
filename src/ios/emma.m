//
//  emma.h
//  emma
//

#import <Cordova/CDV.h>
#import "eMMa.h"

@interface emma : CDVPlugin

@end

@implementation emma

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

@end