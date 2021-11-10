#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "QrMobileVisionPlugin.h"

FOUNDATION_EXPORT double qr_mobile_visionVersionNumber;
FOUNDATION_EXPORT const unsigned char qr_mobile_visionVersionString[];

