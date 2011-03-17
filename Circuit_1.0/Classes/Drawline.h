//
//  drawline.h
//  Circuit_1.0
//
//  Created by Wilson Chin on 3/15/11.
//  Copyright 2011 George Washington University. All rights reserved.
//

#import <UIKit/UIKit.h>

struct cdPoint {
	NSMutableArray *x;
	NSMutableArray *y;
	//BOOL is;
};
typedef struct cdPoint cdPoint;

@interface Drawline : UIView {
	cdPoint ob_points;
	cdPoint _linkpair;
	CGPoint begin_point;
	CGPoint end_point;
	CGPoint *ini;
	
}



@property (nonatomic) CGPoint begin_point;
@property (nonatomic) CGPoint end_point;

- (void)updateid:(NSMutableArray *)views;

@end
