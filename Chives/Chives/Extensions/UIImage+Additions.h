//
//  UIImage+Additions.h
//  Tivvi
//
//  Created by Gurminder Deep Singh on 3/8/14.
//  Copyright (c) 2014 Tag Run Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)changeImageColor:(UIColor *)color;

- (NSString *)base64String;

+ (UIImage *)imageFromBase64String:(NSString *)string;

+ (UIImage *)resizeImage:(UIImage*)image newSize:(CGSize)newSize;

@end
