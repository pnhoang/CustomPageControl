//
//  ViewController.m
//  test_paging_indicator
//
//  Created by Hoang Pham on 7/23/15.
//  Copyright (c) 2015 Hoang Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
	CGFloat _currentPage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_currentPage = 0;
	[_pageView setCurrentPage: _currentPage];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)changePage:(id)sender
{
	_currentPage = _currentPage + 1;
	if (_currentPage == _pageView.numberOfPages) {
		_currentPage = 0;
	}
	[_pageView setCurrentPage: _currentPage];
}


@end
