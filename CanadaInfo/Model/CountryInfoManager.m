//
//  CountryInfoManager.m
//  CanadaInfo
//
//  Created by mac_admin on 15/05/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "CountryInfoManager.h"
#import "Constants.h"


@implementation CountryInfoManager

- (void)getCountryInformation {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    AFHTTPResponseSerializer * serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    manager.responseSerializer = serializer;
    NSURL *URL = [NSURL URLWithString: serverURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                    } else {
                                                        NSString *iso = [[NSString alloc] initWithData:responseObject encoding:NSISOLatin1StringEncoding];
                                                        NSData *dutf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
                                                        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dutf8 options:NSJSONReadingMutableContainers error:nil];
                                                        NSLog(@"%@",dict);
                                                    }
                                                }];
    [dataTask resume];
}

@end
