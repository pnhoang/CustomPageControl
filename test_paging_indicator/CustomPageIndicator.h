//
//  CustomPageIndicator.h
//  test_paging_indicator
//
//  Created by Hoang Pham on 7/23/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

@import UIKit;

@interface CustomPageIndicator : UIView

@property(nonatomic) IBInspectable NSInteger numberOfPages;          // default is 0
@property(nonatomic) IBInspectable NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;   // returns minimum size required to display dots for given page count. can be used to size control if page count could change

@property(nonatomic,strong) IBInspectable UIColor *pageIndicatorTintColor;
@property(nonatomic,strong) IBInspectable UIColor *currentPageIndicatorTintColor;



@end
