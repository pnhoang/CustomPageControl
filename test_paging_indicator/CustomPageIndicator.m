//
//  CustomPageIndicator.m
//  test_paging_indicator
//
//  Created by Hoang Pham on 7/23/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import "CustomPageIndicator.h"

@interface CustomPageIndicator ()
{
	BOOL _outerCircleLayersPresent;
}

@end

@implementation CustomPageIndicator

+ (Class)layerClass
{
	return [CAShapeLayer class];
}

- (CAShapeLayer *) shaperLayer
{
	return (CAShapeLayer *)self.layer;
}

#define INNER_RADIUS 5
#define OUTER_RADIUS 8
#define SPACING_BETWEEN_CIRCLES 8

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount
{
	CGFloat width = 2 * OUTER_RADIUS * pageCount + (pageCount - 1) * SPACING_BETWEEN_CIRCLES;
	CGFloat height = 2 * OUTER_RADIUS;
	return CGSizeMake(width, height);
}

- (CGSize)intrinsicContentSize
{
	if (self.numberOfPages >= 0)
	{
		return [self sizeForNumberOfPages: self.numberOfPages];
	}
	else{
		return CGSizeZero;
	}
}

- (void)layoutSubviews
{
	CGSize size = [self sizeForNumberOfPages: self.numberOfPages];
	self.bounds = CGRectMake(0, 0, size.width, size.height);
	CGPoint center = CGPointMake(OUTER_RADIUS, OUTER_RADIUS);
	
//	UIColor *tintColor = [UIColor colorWithRed: 242/255.0 green: 190/255.0 blue: 3/255.0 alpha: 1];
	UIColor *tintColor = [UIColor whiteColor];
	
	if (!_outerCircleLayersPresent)
	{
		for (NSUInteger i = 0; i < self.numberOfPages; i++)
		{
			CAShapeLayer *outerCircle = [CAShapeLayer layer];
			CGFloat centerOrgX = i * ( 2 * OUTER_RADIUS + SPACING_BETWEEN_CIRCLES);
			outerCircle.frame = CGRectMake(centerOrgX, 0, 2 * OUTER_RADIUS, 2 * OUTER_RADIUS);
			
			UIBezierPath *outerPath = [UIBezierPath bezierPathWithArcCenter: center
																															 radius: OUTER_RADIUS
																													 startAngle:0
																														 endAngle: 2 * M_PI
																														clockwise: YES];
			[outerCircle setStrokeColor: tintColor.CGColor];
			[outerCircle setFillColor: [tintColor colorWithAlphaComponent: 0.2].CGColor];
			
			outerCircle.path = outerPath.CGPath;
			
			outerCircle.shouldRasterize = YES;
			outerCircle.rasterizationScale = [UIScreen mainScreen].scale;
			[[self shaperLayer] addSublayer: outerCircle];
			
		}
		
		_outerCircleLayersPresent = YES;
	}
	
	
	CGFloat innerCenterX = OUTER_RADIUS + self.currentPage * ( 2 * OUTER_RADIUS + SPACING_BETWEEN_CIRCLES);
	
	UIBezierPath *innerPath = [UIBezierPath bezierPathWithArcCenter: CGPointMake(innerCenterX, OUTER_RADIUS)
																													 radius: INNER_RADIUS
																											 startAngle:0
																												 endAngle: 2 * M_PI
																												clockwise:YES];
	
//	[[self shaperLayer] setStrokeColor: [UIColor whiteColor].CGColor];

	[[self shaperLayer] setFillColor: tintColor.CGColor];
	[self shaperLayer].path = innerPath.CGPath;
	[self shaperLayer].rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
	_currentPage = currentPage;
	[self layoutSubviews];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
	_numberOfPages = numberOfPages;
	[self layoutSubviews];
}

@end
