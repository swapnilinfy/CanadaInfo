//
//  FactsInfo.h
//  CanadaInfo
//
//  Created by mac_admin on 15/05/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface FactsInfo : JSONModel

@property(nonatomic) NSString * title;
@property(nonatomic) NSString * description;
@property(nonatomic) NSString * imageURL;

@end
