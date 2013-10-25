//
//  MyAnnotation.m
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa 2010. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;

- (NSString *)subtitle{
	return @"진짜라니까요 ^^";
}
- (NSString *)title{
	return @"저 여기에 있어요!";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate =c;
	NSLog(@"유저의 위도와 경도는 : %f,%f",c.latitude,c.longitude);
	return self;
}

@end
