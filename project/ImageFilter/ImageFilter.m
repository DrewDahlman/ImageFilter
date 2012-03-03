//
//  ImageFilter.m
//
//  Created by Drew Dahlman 2/25/2012. 
//  Copyright 2012 Drew Dahlman. All rights reserved.
//  version 1.0

/*
 Copyright (c) 2012 Drew Dahlman
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import <QuartzCore/QuartzCore.h>
#import "ImageFilter.h"
#import <UIKit/UIKit.h>
@implementation ImageFilter 
@synthesize callbackID;

// For clean up purposes sometimes the apps will cache images, so this cleans things up
-(void)clean:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    // Path to the Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0)
    {
        NSError *error = nil;  
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        // Print out the path to verify we are in the right place
        NSString *directory = [paths objectAtIndex:0];
        NSLog(@"Directory: %@", directory);
        
        // For each file in the directory, create full path and delete the file
        for (NSString *file in [fileManager contentsOfDirectoryAtPath:directory error:&error])
        {    
            NSString *filePath = [directory stringByAppendingPathComponent:file];
            NSLog(@"File : %@", filePath);
            
            BOOL fileDeleted = [fileManager removeItemAtPath:filePath error:&error];
            
            if (fileDeleted != YES || error != nil)
            {
                
            }
        }
        
    }
    NSLog(@"CLEAN!");
}

// FILTERS
// Each filter uses the CoreImage Framework, and can be changed and added to.
// If you wish to create a new filter use the none as a template.
-(void)none:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    // Start by getting path to image
    NSString *filePath = [options objectForKey:@"image"];
    // CREATE NSURL
    NSURL *fileNameAndPath = [NSURL URLWithString:filePath];
    NSLog(@"FILE PATH: %@",fileNameAndPath);
    
    // DEFINE OUR CIImage
    CIImage *beginImage = 
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // DO ALL MODIFICATIONS HERE.
    
    
    // CREATE CIIMageRef from our CIImage
    // Be sure to reference the correct CIImage in both the createCGIImage and fromRect
    CGImageRef cgimg = 
    [context createCGImage:beginImage fromRect:[beginImage extent]];
    
    // CREATE UIImage out of CIImage
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    // GET IMAGE DATA AND CONSTRUCT URL TO THE APPS DOCUMENT FOLDER
    NSData *imageData = UIImageJPEGRepresentation(newImg,1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsPath = [paths objectAtIndex:0]; 
    NSString *filePathB = [documentsPath stringByAppendingPathComponent:@"none.jpg"]; 
    
    // SAVE IMAGE DATA TO DOCUMENTS FOLDER
    [imageData writeToFile:filePathB atomically:YES];
    
    // CHECK IF THE SAVE KEY IS SET TO TRU
    NSString *save = [options objectForKey:@"save"];
    NSLog(@"SAVED: %@",save);
    
    // IF TRUE THEN SAVE IMAGE TO CAMERA ROLL
    if([save isEqualToString:@"true"]){
        UIImageWriteToSavedPhotosAlbum(newImg, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    // RELEASE OUR IMAGE AND DONE
    CGImageRelease(cgimg);
    
    // CALLBACK TO JAVASCRIPT WITH IMAGE URI
    self.callbackID = [arguments pop];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK 
                                                messageAsString:filePathB];
    
    /* Create JS to call the success function with the result */
    NSString *successScript = [pluginResult toSuccessCallbackString:self.callbackID];
    /* Output the script */
    [self writeJavascript:successScript];

    
    
}
-(void)stark:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    
    NSString *filePath = [options objectForKey:@"image"];
    NSURL *fileNameAndPath = [NSURL URLWithString:filePath];
    
    CIImage *beginImage = 
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls" 
                                  keysAndValues: kCIInputImageKey, beginImage, 
                        @"inputSaturation", [NSNumber numberWithFloat:.1],
                        @"inputContrast", [NSNumber numberWithFloat:1], 
                        nil];
    CIImage *outputImage = [filter outputImage];
    
    CIFilter *filterB = [CIFilter filterWithName:@"CIGammaAdjust" 
                                  keysAndValues: kCIInputImageKey, outputImage, 
                        @"inputPower", [NSNumber numberWithFloat:1.5], 
                        nil];
    
    CIImage *outputImageB = [filterB outputImage];
    
    CGImageRef cgimg = 
    [context createCGImage:outputImageB fromRect:[outputImageB extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    NSData *imageData = UIImageJPEGRepresentation(newImg,1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory 
    NSString *filePathB = [documentsPath stringByAppendingPathComponent:@"stark.jpg"]; //Add the file name
    
    [imageData writeToFile:filePathB atomically:YES];
    
    NSString *save = [options objectForKey:@"save"];
    NSLog(@"SAVED: %@",save);
    if([save isEqualToString:@"true"]){
        UIImageWriteToSavedPhotosAlbum(newImg, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    CGImageRelease(cgimg);
    
    // CALLBACK TO JAVASCRIPT WITH IMAGE URI
    self.callbackID = [arguments pop];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK 
                                                messageAsString:filePathB];
    
    /* Create JS to call the success function with the result */
    NSString *successScript = [pluginResult toSuccessCallbackString:self.callbackID];
    /* Output the script */
    [self writeJavascript:successScript];
}
-(void)sunnySide:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    // FILTER
    NSString *filePath = [options objectForKey:@"image"];
    NSURL *fileNameAndPath = [NSURL URLWithString:filePath];
    
    CIImage *beginImage = 
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIWhitePointAdjust" 
                                  keysAndValues: kCIInputImageKey, beginImage, 
                        @"inputColor",[CIColor colorWithRed:254 green:197 blue:0 alpha:1],
                        nil];
    CIImage *outputImage = [filter outputImage];
    
    CIFilter *filterB = [CIFilter filterWithName:@"CITemperatureAndTint" 
                                keysAndValues: kCIInputImageKey, outputImage, 
                        @"inputNeutral",[CIVector vectorWithX:5500 Y:1300 Z:0],
                        @"inputTargetNeutral",[CIVector vectorWithX:4000 Y:0 Z:0],
                        nil];
    CIImage *outputImageB = [filterB outputImage];
    
    NSString *bgPath = 
    [[NSBundle mainBundle] pathForResource:@"painter" ofType:@"png"];
    NSURL *bgPathName = [NSURL fileURLWithPath:bgPath];
    
    CIImage *bgIMG = 
    [CIImage imageWithContentsOfURL:bgPathName];
    
    CIFilter *filterD = [CIFilter filterWithName:@"CISourceOverCompositing" 
                                   keysAndValues: kCIInputImageKey, bgIMG, 
                         @"inputBackgroundImage",outputImageB,
                         nil];
    CIImage *outputImageD = [filterD outputImage];
    
    CGImageRef cgimg = 
    [context createCGImage:outputImageD fromRect:[outputImageD extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    
    NSData *imageData = UIImageJPEGRepresentation(newImg,1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory 
    NSString *filePathB = [documentsPath stringByAppendingPathComponent:@"sunnyside.jpg"]; //Add the file name
    
    [imageData writeToFile:filePathB atomically:YES];
    
    NSString *save = [options objectForKey:@"save"];
    NSLog(@"SAVED: %@",save);
        if([save isEqualToString:@"true"]){
        UIImageWriteToSavedPhotosAlbum(newImg, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    CGImageRelease(cgimg);
    
    // CALLBACK TO JAVASCRIPT WITH IMAGE URI
    self.callbackID = [arguments pop];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK 
                                                messageAsString:filePathB];
    
    /* Create JS to call the success function with the result */
    NSString *successScript = [pluginResult toSuccessCallbackString:self.callbackID];
    /* Output the script */
    [self writeJavascript:successScript];
    
}
-(void)worn:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    // FILTER
    NSString *filePath = [options objectForKey:@"image"];
    NSURL *fileNameAndPath = [NSURL URLWithString:filePath];
    
    CIImage *beginImage = 
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIWhitePointAdjust" 
                                  keysAndValues: kCIInputImageKey, beginImage, 
                        @"inputColor",[CIColor colorWithRed:212 green:235 blue:241 alpha:1],
                        nil];
    CIImage *outputImage = [filter outputImage];
    
    CIFilter *filterB = [CIFilter filterWithName:@"CIColorControls" 
                                   keysAndValues: kCIInputImageKey, outputImage, 
                         @"inputSaturation", [NSNumber numberWithFloat:.6],
                         @"inputContrast", [NSNumber numberWithFloat:1], 
                         nil];
    CIImage *outputImageB = [filterB outputImage];
    
    CIFilter *filterC = [CIFilter filterWithName:@"CITemperatureAndTint" 
                                   keysAndValues: kCIInputImageKey, outputImageB, 
                         @"inputNeutral",[CIVector vectorWithX:6500 Y:2000 Z:0],
                         @"inputTargetNeutral",[CIVector vectorWithX:5200 Y:0 Z:0],
                         nil];
    CIImage *outputImageC = [filterC outputImage];
    
    NSString *framePath = 
    [[NSBundle mainBundle] pathForResource:@"vignette4" ofType:@"png"];
    NSURL *framePathName = [NSURL fileURLWithPath:framePath];
    
    CIImage *frameImg = 
    [CIImage imageWithContentsOfURL:framePathName];
    
    CIFilter *filterD = [CIFilter filterWithName:@"CISourceOverCompositing" 
                                   keysAndValues: kCIInputImageKey, frameImg, 
                         @"inputBackgroundImage",outputImageC,
                         nil];
    CIImage *outputImageD = [filterD outputImage];
    
    CGImageRef cgimg = 
    [context createCGImage:outputImageD fromRect:[outputImageD extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    NSData *imageData = UIImageJPEGRepresentation(newImg,1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory 
    NSString *filePathB = [documentsPath stringByAppendingPathComponent:@"worn.jpg"]; //Add the file name
    
    [imageData writeToFile:filePathB atomically:YES];
    
    NSString *save = [options objectForKey:@"save"];
    NSLog(@"SAVED: %@",save);
    if([save isEqualToString:@"true"]){
        UIImageWriteToSavedPhotosAlbum(newImg, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    CGImageRelease(cgimg);
    
    // CALLBACK TO JAVASCRIPT WITH IMAGE URI
    self.callbackID = [arguments pop];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK 
                                                messageAsString:filePathB];
    
    /* Create JS to call the success function with the result */
    NSString *successScript = [pluginResult toSuccessCallbackString:self.callbackID];
    /* Output the script */
    [self writeJavascript:successScript];
    
}
-(void)vintage:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
    // FILTER
    NSString *filePath = [options objectForKey:@"image"];
    NSURL *fileNameAndPath = [NSURL URLWithString:filePath];
    
    CIImage *beginImage = 
    [CIImage imageWithContentsOfURL:fileNameAndPath];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIWhitePointAdjust" 
                                  keysAndValues: kCIInputImageKey, beginImage, 
                        @"inputColor",[CIColor colorWithRed:121 green:195 blue:219 alpha:1],
                        nil];
    CIImage *outputImage = [filter outputImage];
    
    CIFilter *filterB = [CIFilter filterWithName:@"CIColorControls" 
                                   keysAndValues: kCIInputImageKey, outputImage, 
                         @"inputSaturation", [NSNumber numberWithFloat:.6],
                         @"inputContrast", [NSNumber numberWithFloat:1.1], 
                         nil];
    CIImage *outputImageB = [filterB outputImage];
    
    NSString *framePath = 
    [[NSBundle mainBundle] pathForResource:@"vintage" ofType:@"png"];
    NSURL *framePathName = [NSURL fileURLWithPath:framePath];
    
    CIImage *frameImg = 
    [CIImage imageWithContentsOfURL:framePathName];
    
    CIFilter *filterD = [CIFilter filterWithName:@"CISourceOverCompositing" 
                                   keysAndValues: kCIInputImageKey, frameImg, 
                         @"inputBackgroundImage",outputImageB,
                         nil];
    CIImage *outputImageD = [filterD outputImage];
    
    CGImageRef cgimg = 
    [context createCGImage:outputImageD fromRect:[outputImageD extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    
    NSData *imageData = UIImageJPEGRepresentation(newImg,1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);  
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory 
    NSString *filePathB = [documentsPath stringByAppendingPathComponent:@"vintage.jpg"]; //Add the file name
    
    [imageData writeToFile:filePathB atomically:YES];
    
    NSString *save = [options objectForKey:@"save"];
    NSLog(@"SAVED: %@",save);
    if([save isEqualToString:@"true"]){
        UIImageWriteToSavedPhotosAlbum(newImg, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    CGImageRelease(cgimg);
    
    // CALLBACK TO JAVASCRIPT WITH IMAGE URI
    self.callbackID = [arguments pop];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK 
                                                messageAsString:filePathB];
    
    /* Create JS to call the success function with the result */
    NSString *successScript = [pluginResult toSuccessCallbackString:self.callbackID];
    /* Output the script */
    [self writeJavascript:successScript];
}

// CAMERA ROLL SAVER
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error 
  contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message...
        NSLog(@"ERROR: %@",error);
    }
    else  // No errors
    {
        // Show message image successfully saved
        NSLog(@"IMAGE SAVED!");
    }
}
@end