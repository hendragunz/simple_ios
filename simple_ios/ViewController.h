//
//  ViewController.h
//  simple_ios
//
//  Created by Hendra Gunawan on 1/24/13.
//  Copyright (c) 2013 Hendra Gunawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *questionsList;
@property (retain, nonatomic) NSMutableArray *questions;


// connection
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *question_data;
@property (retain, nonatomic) NSMutableURLRequest* request;

- (IBAction)loginOAuth:(id)sender;

@end
