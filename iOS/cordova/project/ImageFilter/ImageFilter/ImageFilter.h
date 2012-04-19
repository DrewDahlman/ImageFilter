//
//  ImageFilter.h
//
//  Created by Drew Dahlman 2/25/2012. 
//  Copyright 2012 Drew Dahlman. All rights reserved.
//  version 1.0

//  Current Filters:
//  none
//  stark
//  sunnySide
//  worn
//  vintage

/*
Copyright (c) 2012 Drew Dahlman MIT LICENSE
*/


#import <Foundation/Foundation.h>

#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVPlugin.h>
#else
#import "CDVPlugin.h"
#endif


@interface ImageFilter : CDVPlugin {
    NSString* callbackID;
}
@property (nonatomic, retain) NSString* callbackID;


// GARBAGE
- (void)clean:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

// FILTERS
- (void)none:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)stark:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)sunnySide:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)worn:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)vintage:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
@end
