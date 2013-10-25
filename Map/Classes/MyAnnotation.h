//
//  MyAnnotation.h
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation> {

	CLLocationCoordinate2D coordinate;

}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;
- (NSString *)title;
- (NSString *)subtitle;

@end
