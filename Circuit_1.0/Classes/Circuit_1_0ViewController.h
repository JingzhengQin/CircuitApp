//
//  Circuit_1_0ViewController.h
//  Circuit_1.0
//
//  Created by Wilson Chin on 3/11/11.
//  Copyright 2011 George Washington University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drawline.h"

@interface Circuit_1_0ViewController : UIViewController {
	UIImageView *checkview;
	NSMutableArray *checkedarray;
	UIImageView	*currentview;
	Drawline *drawline;
	NSMutableArray *idview;
}
struct IPoint {
	int x;
	int y;
	BOOL is;
};
typedef struct IPoint IPoint;

@property (retain, nonatomic)UIImageView *checkview;
@property (retain, nonatomic)NSMutableArray *checkedarray;
@property (retain, nonatomic)UIImageView *currentview;
@property (retain, nonatomic)Drawline *drawline;

- (id)closestview:(CGPoint)point;
- (CGFloat)distance:(CGPoint)point1 to:(CGPoint)point2;
- (IPoint)checkexist:(id)element;
//- (void)drawRect:(CGRect)rect;
@end
//UIBezierPath to draw line
