//
//  ViewController.h
//  test_paging_indicator
//
//  Created by Hoang Pham on 7/23/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPageIndicator.h"

@interface ViewController : UIViewController
{
	IBOutlet CustomPageIndicator *_pageView;
}

- (IBAction)changePage:(id)sender;

@end

