    //
//  MainViewController.m
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MainViewController.h"
#import "MyAnnotation.h"

@implementation MainViewController

@synthesize locationManager;
@synthesize coordinate;
@synthesize longitude;
@synthesize latitude;
@synthesize myPlaceMark;
@synthesize myAnnotation;
@synthesize myMapView;
@synthesize whereIamBtn;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self setLocationData];	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.locationManager = nil;
	self.myMapView = nil;
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.locationManager = nil;
	self.myMapView = nil;
	self.whereIamBtn = nil;
}


-(void) setLocationData{
	
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
	locationManager.distanceFilter = kCLDistanceFilterNone;
	[locationManager startUpdatingLocation];
	[locationManager startUpdatingHeading];
	coordinate = locationManager.location.coordinate;

}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	NSLog(@"에러가 발생했습니다.");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	
	if (mapView.userLocation == annotation){
		return nil;
	}
	 
	NSString *identifier = @"MY_IDENTIFIER";
	
	MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];

	annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
	annotationView.canShowCallout = YES;
	return annotationView;
}


- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{
	myPlaceMark=placemark;
	[myMapView addAnnotation:placemark];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{

	coordinate = newLocation.coordinate;
	latitude = coordinate.latitude;
	longitude = coordinate.longitude;
	
	if(oldLocation != nil){
		CLLocationDistance d = [newLocation distanceFromLocation:oldLocation]; //유저의 이동거리 (필요하실때 사용하세요)
	}
	
	MKCoordinateRegion region;
	region.center=coordinate;

	MKCoordinateSpan span;
	span.latitudeDelta=0.01;
	span.longitudeDelta=0.01;
	region.span=span;
	
	[myMapView setRegion:region animated:YES];
	
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error{
	NSLog(@"GPS측정이 되지 않았습니다!");
}


-(IBAction) showMyLocation {
	
	MyAnnotation* anno = [[MyAnnotation alloc] initWithCoordinate: coordinate];
	[myMapView addAnnotation:anno];
}

- (void)dealloc {
	
	[locationManager release];
	[myPlaceMark release];
	[myMapView release];
	[myAnnotation release];
	[whereIamBtn release];
    [super dealloc];
}


@end
