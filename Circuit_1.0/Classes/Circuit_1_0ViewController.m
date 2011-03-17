//
//  Circuit_1_0ViewController.m
//  Circuit_1.0
//
//  Created by Wilson Chin on 3/11/11.
//  Copyright 2011 George Washington University. All rights reserved.
//

#import "Circuit_1_0ViewController.h"
#import "Drawline.h"

@implementation Circuit_1_0ViewController
@synthesize checkview;
@synthesize checkedarray;
@synthesize currentview;
@synthesize drawline;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
/*
- (void)drawRect:(CGRect)rect
{
    // Create an oval shape to draw.
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:
						   CGRectMake(0, 0, 200, 100)];
	
    // Set the render colors
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
	
    CGContextRef aRef = UIGraphicsGetCurrentContext();
	
    // If you have content to draw after the shape,
    // save the current state before changing the transform
    //CGContextSaveGState(aRef);
	
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 50, 50);
	
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
	
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
	
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
	
	
	UIBezierPath*    aaPath = [UIBezierPath bezierPath];
	
	// Set the starting point of the shape.
	[aaPath moveToPoint:CGPointMake(100.0, 0.0)];
	
	// Draw the lines
	[aaPath addLineToPoint:CGPointMake(200.0, 40.0)];
	[aaPath addLineToPoint:CGPointMake(160, 140)];
	[aaPath addLineToPoint:CGPointMake(40.0, 140)];
	[aaPath addLineToPoint:CGPointMake(0.0, 40.0)];
	[aaPath closePath];
	[aaPath fill];
	[aaPath stroke];
}
*/




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//CGRect r = CGRectMake(100, 100, 300, 300);
	//[self drawRect:r];
	drawline=[[Drawline alloc] initWithFrame:self.view.frame];
	drawline.backgroundColor = [UIColor clearColor];
	[self.view addSubview:drawline];
	idview = [[NSMutableArray alloc] init];
	checkedarray = [[NSMutableArray alloc] init];
	UIImage *image = [UIImage imageNamed:@"resistances.jpg"];
	checkview = [[UIImageView alloc]initWithImage:image];
	CGRect newFrame = CGRectMake(10,10,250,250);
	[checkview setFrame:newFrame];
	checkview.contentMode = UIViewContentModeScaleAspectFit;
	[self.view addSubview:checkview];
	[self.view bringSubviewToFront:checkview];
	[checkedarray addObject:[[NSMutableArray alloc] init]];
	[[checkedarray objectAtIndex:0] addObject:checkview];
	[idview addObject:checkview];
	[image release];
	//UIImageView *anview;
	//NSLog(@"index of checkview: %i", [checkedarray indexOfObject:checkview]);
	NSLog(@"count of checkview: %i", [checkedarray count]);
	[drawline updateid:idview];
	//[checkview release];
}

- (id)closestview:(CGPoint)point{
	CGFloat min = 100000;
	CGFloat i;
	UIImageView *cur;
	for (NSMutableArray *marray in checkedarray)
		for (UIImageView *im in marray) {
			CGPoint p;
			p.x=im.center.x;
			p.y=im.center.y;
			i = [self distance:p to:point];
			if (i < min){
			min = i;
			cur = im;
		}
	}
	return cur;
}

- (CGFloat)distance:(CGPoint)point1 to:(CGPoint)point2{
	CGFloat dx = point1.x - point2.x;
	CGFloat dy = point1.y - point2.y;
	CGFloat i = sqrt(dx * dx + dy * dy);
	return i;
}

- (IPoint)checkexist:(id)element{
	IPoint point;
	point.is = NO;
	point.x = 0;
	point.y = 0;
	for (NSMutableArray *marray in checkedarray) {
		point.x = [checkedarray indexOfObject:marray];
		if ([marray containsObject:element]) {
			point.y = [marray indexOfObject:element];
			point.is = YES;
			return point;
		}
	}
	return point;
}
/*
- (void)drawRect:(CGRect)rect
{
    // Create an oval shape to draw.
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:
						   CGRectMake(50, 50, 200, 100)];
	
    // Set the render colors
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
	
    CGContextRef aRef = UIGraphicsGetCurrentContext();
	
    // If you have content to draw after the shape,
    // save the current state before changing the transform
    //CGContextSaveGState(aRef);
	
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 50, 50);
	
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
	
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
	
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

	
	//UITouch *touch = [[event touchesForView:checkview]anyObject];
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint currentPoint = [touch locationInView:[self view]];
	currentview = [self closestview:currentPoint];
	/*CGFloat i;
	UIImageView *cur;
	for (UIImageView *im in checkedarray) {	
		CGFloat min = 100000;
		CGPoint p;
		p.x=im.center.x;
		p.y=im.center.y;
		i = [self distance:p to:currentPoint];
		if (i < min){
			min = i;
			cur = im;}
	}*/
	//UIImageView *view2 = [self closestview:currentPoint];
	//CGPoint point2;
	//point2.x=cur.center.x;
	//point2.y=view2.center.y;
	//[self distance:currentPoint to:point2];
	if([self distance:currentPoint to:[currentview center]]<=180){
		//if ([currentview isEqual:[[checkedarray objectAtIndex:0] objectAtIndex:0]]) {
		if ([[checkedarray objectAtIndex:0] containsObject:currentview]) {
	UIImage *image = [UIImage imageNamed:@"resistance.png"];
	UIImageView *anview = [[UIImageView alloc]initWithImage:image];
	CGRect newFrame = CGRectMake(currentPoint.x-25,currentPoint.y-25,50,50);
	[anview setFrame:newFrame];
	anview.contentMode = UIViewContentModeScaleAspectFit;
			NSMutableArray *anarray =[[NSMutableArray alloc] init];
			[anarray addObject:anview];
		[checkedarray addObject:anarray];
			
	//[checkedarray addObject:anview];
	[self.view addSubview:anview];
	currentview = anview;
	NSLog(@"count of checkedarray: %i", [checkedarray count]);
	[image release];
	[anview release];
	[anarray release];
		}
		else if([self distance:currentPoint to:[currentview center]]>=25)
			currentview = nil;
	}
	else {
		currentview = nil;
	}

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

	UITouch *touch = [[event allTouches] anyObject];
	//UITouch *touch = [[event touchesForView:checkview] anyObject];
	CGPoint currentPoint = [touch locationInView:[self view]];
	//CGPoint currentPoint = CGPointMake(300,300);

	//if(touch.view != self.view)
	currentview.center = currentPoint;
//		[touch view].center = currentPoint;
	[drawline setBegin_point:currentPoint];
	[drawline setEnd_point:checkview.center];
	//NSMutableArray *ps = [[NSMutableArray alloc] init];
	//[ps addObject:currentPoint];
	//NSLog(@"x:%f",currentPoint.x);
	//CGRect r = CGRectMake(100, 100, 300, 300);
	//[drawline drawRect:r];
	[drawline setNeedsDisplay];

}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
