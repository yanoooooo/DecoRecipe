//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CVUtil : NSObject

#define MAX_CLUSTERS 1

+ (UIImage *)reduceColor:(UIImage *)src_img;

@end