//
//  ViewController.m
//  postData_sample_AFNetworking
//
//  Created by Chang YuanYu on 2014/4/24.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import "ViewController.h"
// import AFNetworking library header"
#import "AFNetworking.h"


static NSString *const BaseURLString =
@"http://yourIP.php";



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadWebserverData];
}

// ======================AFNetworking======================
// use AFNetworking
-(void) loadWebserverData
{
    AFHTTPRequestOperationManager *manager =
    [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObject:@"text/html"];
    
    NSDictionary *parameters = @{@"data" : @"hello world"};

    
    [manager POST:BaseURLString
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@" JSON: %@ ", responseObject);
              //       NSDictionary *responseJSONObj =[NSJSONSerialization
              // JSONObjectWithData:responseObj];
              
              NSLog(@"result:%@", [responseObject objectForKey:@"result"]);
   
              
          }
          failure:^(AFHTTPRequestOperation *operation,
                    NSError *error) {
              NSLog(@"error %@,", error);
              

          }];
}
// ======================AFNetworking======================

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
