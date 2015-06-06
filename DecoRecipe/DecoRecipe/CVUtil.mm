//
//  CVUtil.m
//  Manicurist
//
//  Created by Yano on 2015/06/05.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

#import "Manicurist-Bridging-Header.h"
#import <opencv2/opencv.hpp>
#import <opencv2/highgui/ios.h>

@implementation CVUtil

//** reduce color **//
+ (UIImage *)reduceColor:(UIImage *)src_img
{
    int size;
    cv::Mat dst_img = [self UIImage2cvMat:src_img];
    cv::Mat sub_img = dst_img;
    CvMat *clusters;
    CvMat *points;
    CvMat *color = cvCreateMat (MAX_CLUSTERS, 1, CV_32FC4);
    CvMat *count = cvCreateMat (MAX_CLUSTERS, 1, CV_32SC1);
    
    //read image
    size = (float)sub_img.cols * (float)sub_img.rows;
    clusters = cvCreateMat (size, 1, CV_32SC1);
    points = cvCreateMat (size, 1, CV_32FC4);
    
    //push to pixel row
    for (int i = 0; i < size; i++) {
        points->data.fl[i * 4 + 0] = sub_img.data[i * 4 + 0];
        points->data.fl[i * 4 + 1] = sub_img.data[i * 4 + 1];
        points->data.fl[i * 4 + 2] = sub_img.data[i * 4 + 2];
        //points->data.fl[i * 4 + 3] = sub_img.data[i * 4 + 3];
    }
    
    //classtaring
    cvKMeans2 (points, MAX_CLUSTERS, clusters, cvTermCriteria (CV_TERMCRIT_EPS + CV_TERMCRIT_ITER, 10, 1.0));
    
    //calcurate of average of each class
    cvSetZero (color);
    cvSetZero (count);
    for (int i = 0; i < size; i++) {
        int idx = clusters->data.i[i];
        int j = ++count->data.i[idx];
        color->data.fl[idx * 4 + 0] = color->data.fl[idx * 4 + 0] * (j - 1) / j + points->data.fl[i * 4 + 0] / j;
        color->data.fl[idx * 4 + 1] = color->data.fl[idx * 4 + 1] * (j - 1) / j + points->data.fl[i * 4 + 1] / j;
        color->data.fl[idx * 4 + 2] = color->data.fl[idx * 4 + 2] * (j - 1) / j + points->data.fl[i * 4 + 2] / j;
    }
    
    //push color
    for (int i = 0; i < size; i++) {
        int idx = clusters->data.i[i];
        dst_img.data[i * 4 + 0] = color->data.fl[idx * 4 + 0];
        dst_img.data[i * 4 + 1] = color->data.fl[idx * 4 + 1];
        dst_img.data[i * 4 + 2] = color->data.fl[idx * 4 + 2];
        dst_img.data[i * 4 + 3] = sub_img.data[i * 4 + 3];
    }
    
    cvReleaseMat (&clusters);
    cvReleaseMat (&points);
    cvReleaseMat (&color);
    cvReleaseMat (&count);
    
    return [self cvMat2UIImage:dst_img];
}

//** UIImage change to cvMat **//
+ (cv::Mat)UIImage2cvMat:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaPremultipliedLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);
    
    return cvMat;
}

//** cvMat change to UIImage **//
+ (UIImage *)cvMat2UIImage:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    CGColorSpaceRef colorSpace;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
                                        cvMat.rows,                                 //height
                                        8,                                          //bits per component
                                        8 * cvMat.elemSize(),                       //bits per pixel
                                        cvMat.step[0],                              //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaLast|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );
    
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    
    return finalImage;
}


@end