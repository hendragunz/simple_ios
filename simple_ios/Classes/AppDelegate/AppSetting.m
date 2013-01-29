//
//  AppSetting.m
//  socialtravel
//
//  Created by Hendra Gunawan on 1/23/13.
//  Copyright (c) 2013 Hendra Gunawan. All rights reserved.
//

#import "AppSetting.h"

@implementation AppSetting

@synthesize client_id, client_secret, authorize_token_url, token_url, user_auth, callback_url;

+ (AppSetting *)sharedInstance
{
  // the instance of this class is stored here
  static AppSetting *myInstance = nil;
  
  // check to see if an instance already exists
  if (nil == myInstance) {
    myInstance  = [[[self class] alloc] init];
    // initialize variables here
    myInstance.client_id = @"HemAtkPScvohe6Mv8MaUGC5lAN1TSo7sanDmoMPm";
    myInstance.client_secret = @"lxPusCNhqMhWN9WGeTha2utrO1wPZg1zCEgIkxnm";
    myInstance.token_url = [NSURL URLWithString:@"http://localhost.lan:3000/oauth/token"];
    myInstance.callback_url = @"http://localhost.lan:3000/oauth/callback";
    myInstance.authorize_token_url = [NSURL URLWithString:@"http://localhost.lan:3000/oauth/authorize"];
  }
  // return the instance of this class
  return myInstance;
}


@end
