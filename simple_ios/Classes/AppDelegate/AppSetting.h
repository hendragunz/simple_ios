//
//  AppSetting.h
//  socialtravel
//
//  Created by Hendra Gunawan on 1/23/13.
//  Copyright (c) 2013 Hendra Gunawan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMOAuth2Authentication.h"

@interface AppSetting : NSObject {
  NSString *client_id;
  NSString *client_secret;
  NSURL *token_url;
  NSURL *authorize_token_url;
  NSString *callback_url;
  GTMOAuth2Authentication *user_auth;
}

@property(retain, nonatomic) NSString *client_id;
@property(retain, nonatomic) NSString *client_secret;
@property(retain, nonatomic) NSURL *token_url;
@property(retain, nonatomic) NSURL *authorize_token_url;
@property(retain, nonatomic) NSString *callback_url;
@property(retain, nonatomic) GTMOAuth2Authentication *user_auth;

// Class Methods
+ (AppSetting *)sharedInstance;

@end
