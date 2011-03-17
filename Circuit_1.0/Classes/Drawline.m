//
//  drawline.m
//  Circuit_1.0
//
//  Created by Wilson Chin on 3/15/11.
//  Copyright 2011 George Washington University. All rights reserved.
//

#import "Drawline.h"


@implementation Drawline

@synthesize begin_point;
@synthesize end_point;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		//begin_point = CGPointMake(100.0, 0.0);
		//end_point = CGPointMake(500.0, 500.0);
		//		ini = CGPointMake(100.0, 0.0);
		//[b_points addObject:ini];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{/*
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
  */
	
	UIBezierPath*    thePath = [UIBezierPath bezierPath];
	[thePath moveToPoint:begin_point];
	[thePath addLineToPoint:end_point];
	[thePath stroke];
	//[thePath autorelease];
	
	[self setNeedsDisplay];
}

- (void)updateid:(NSMutableArray *)views{
	/*for (; <#condition#>; <#increment#>) {
		<#statements#>
	}
	*/
	
}

- (void)dealloc {
    [super dealloc];
}


@end
