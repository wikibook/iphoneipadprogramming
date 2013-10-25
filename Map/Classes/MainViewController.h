//
//  MainViewController.h
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import "MyAnnotation.h"

@interface MainViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, MKReverseGeocoderDelegate> {

	CLLocationManager* locationManager;
	CLLocationCoordinate2D coordinate;
	CLLocationDegrees latitude;
	CLLocationDegrees longitude;
	MKPlacemark *myPlaceMark;
	MKMapView *myMapView;
	MKAnnotationView* myAnnotation;
	UIButton* whereIamBtn;
	
}

@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nonatomic, retain) MKPlacemark* myPlaceMark;
@property (nonatomic, retain) IBOutlet MKMapView* myMapView;
@property (nonatomic, retain) MKAnnotationView* myAnnotation;
@property (nonatomic, retain) IBOutlet UIButton* whereIamBtn;


-(void) setLocationData;
-(IBAction) showMyLocation;


@end
