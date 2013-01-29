//
//  ViewController.m
//  simple_ios
//
//  Created by Hendra Gunawan on 1/24/13.
//  Copyright (c) 2013 Hendra Gunawan. All rights reserved.
//

#import "ViewController.h"
#import "AppSetting.h"
#import "GTMOAuth2ViewControllerTouch.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize questionsList, questions, request, connection, question_data;

- (void)viewDidLoad
{
    [super viewDidLoad];
  request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://"]];
  connection = [[NSURLConnection alloc] initWithRequest:request
                                               delegate:self];
  [connection start];
}

- (GTMOAuth2Authentication *)myCustomAuth {
  NSString *kMyClientID = [[AppSetting sharedInstance] client_id];     // pre-assigned by service
  NSString *kMyClientSecret = [[AppSetting sharedInstance] client_secret]; // pre-assigned by service
  NSURL *tokenUrl = [[AppSetting sharedInstance] token_url];
  NSString *redirectUri = [[AppSetting sharedInstance] callback_url];
  
  GTMOAuth2Authentication *auth;
  auth = [GTMOAuth2Authentication authenticationWithServiceProvider:@"api"
                                                           tokenURL:tokenUrl
                                                        redirectURI:redirectUri 
                                                           clientID:kMyClientID
                                                       clientSecret:kMyClientSecret];
  
  [[AppSetting sharedInstance] setUser_auth:auth];
  return auth;
}

- (IBAction)loginOAuth:(id)sender {
  GTMOAuth2Authentication *auth = [self myCustomAuth];
  NSURL *authURL = [[AppSetting sharedInstance] authorize_token_url];
  
  // Display the authentication view
  GTMOAuth2ViewControllerTouch *viewController;
  viewController = [[GTMOAuth2ViewControllerTouch alloc] initWithAuthentication:auth
                                                                authorizationURL:authURL
                                                                keychainItemName:nil
                                                                        delegate:self
                                                                finishedSelector:@selector(viewController:finishedWithAuth:error:)];
  
  // Now push our sign-in view
  [[self navigationController] pushViewController:viewController animated:YES];
}

- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)auth
                 error:(NSError *)error {
  if (error != nil) {
    // Sign-in failed
  } else {
    // Sign-in succeeded
    self.navigationItem.leftBarButtonItem = nil;
    [[AppSetting sharedInstance] setUser_auth:auth];
    
    [[[AppSetting sharedInstance] user_auth] authorizeRequest:request 
                                                     delegate:self 
                                            didFinishSelector:@selector(authentication:request:finishedWithError:)];
  }
}

- (void)authentication:(GTMOAuth2Authentication *)auth
               request:(NSMutableURLRequest *)request
     finishedWithError:(NSError *)error {
  if (error != nil) {
    // Authorization failed
  } else {
    // Authorization succeeded
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Number of rows is the number of time zones in the region for the specified section.
  return  [questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *MyIdentifier = @"QuestionCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                   reuseIdentifier:MyIdentifier];
  }
  cell.textLabel.text = @"Dummy";
  return cell;
}


// when get data from remote server partialy
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  [question_data appendData:data];
}


// when connection has been finished loading data from remove server
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  
  [self.questionsList reloadData];
}

@end
