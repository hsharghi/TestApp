//
//  ViewController.m
//  cpTest
//
//  Created by Hadi Sharghi on ۱۳۹۴/۴/۳ .
//  Copyright (c) ۱۳۹۴ ه‍.ش. Euphrates Media. All rights reserved.
//

#import "ViewController.h"
#import <SSKeychain.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"unique: %@", [self getUniqueDeviceIdentifierAsString]);
}


-(NSString *)getUniqueDeviceIdentifierAsString
{
    
    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *strApplicationUUID = [SSKeychain passwordForService:appName account:@"incoding"];
    if (strApplicationUUID == nil)
    {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:strApplicationUUID forService:appName account:@"incoding"];
    }
    
    return strApplicationUUID;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
