//
//  ViewController.m
//  TableViewTest
//
//  Created by Benedikt Hirmer on 3/20/15.
//  Copyright (c) 2015 HIRMER.me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//=====================================================
#pragma mark -
#pragma mark UITableViewDataSource
//=====================================================


#define kCount 5.f

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.backgroundColor = [UIColor colorWithHue:(CGFloat)indexPath.row/kCount
                                      saturation:1.f
                                      brightness:1.f
                                           alpha:1.f];
    cell.textLabel.text = [@(indexPath.row) stringValue];

    return cell;
}

//=====================================================
#pragma mark -
#pragma mark UITableViewDelegate
//=====================================================

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(self.tableView.bounds) - self.topLayoutGuide.length - self.bottomLayoutGuide.length;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.tableView reloadData];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {

    }];
}

@end
