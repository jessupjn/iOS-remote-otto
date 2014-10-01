//
//  DEMOMenuViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MenuVC.h"
//#import "DEMOHomeViewController.h"
//#import "DEMOSecondViewController.h"
//#import "DEMONavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "UIImage+Additions.h"
#import "Constants.h"

@implementation MenuVC {
    NSArray *deviceList;
    NSIndexPath *selectedPath;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDeviceList];
    
    self.tableView.separatorColor = [UIColor darkGrayColor];
    self.tableView.bounces = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"avatar.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor lightTextColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Chives";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor lightTextColor];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
    
    self.view.layer.borderWidth = 1;
    self.view.layer.borderColor = [UIColor darkTextColor].CGColor;
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)loadDeviceList
{
    deviceList = @[@"Plasma TV", @"Cable"];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:(233.0/255) green:(233.0/255) blue:(233.0/255) alpha:0.3];
    [cell setSelectedBackgroundView:bgColorView];

    UIImage *img = cell.imageView.image;
    img = [img changeImageColor:[UIColor whiteColor]];
    [cell.imageView setHighlightedImage:img];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    return sectionIndex == 0 ? nil : ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
        view.backgroundColor = [UIColor colorWithRed:130/255.0f green:130/255.0f blue:130/255.0f alpha:0.3f];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
        label.text = @"Devices";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [label sizeToFit];
        [view addSubview:label];
        view;
    });
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return sectionIndex == 0 ? 0 : 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.frostedViewController hideMenuViewController];
    NSString *identifier = @"";
    if(indexPath.section == 0)
    {
        identifier = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    }
    else if(indexPath.section == 1)
    {
        identifier = @"Remote";
    }
    
    [self.delegate didSelectMenuItem:identifier];

}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if(sectionIndex == 0) return 2;
    return deviceList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.textLabel.textColor = [UIColor lightGrayColor];
        [cell.textLabel setHighlightedTextColor:[UIColor whiteColor]];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Home", @"Settings"];
        cell.textLabel.text = titles[indexPath.row];
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"Button%@", titles[indexPath.row]]];
        img = [img changeImageColor:[UIColor lightTextColor]];
        [cell.imageView setImage:img];
        img = [img changeImageColor:[UIColor whiteColor]];
        [cell.imageView setHighlightedImage:img];
    } else {
        cell.textLabel.text = deviceList[indexPath.row];
        UIImage *img = [UIImage imageNamed:@"ButtonRemote"];
        img = [img changeImageColor:[UIColor lightTextColor]];
        [cell.imageView setImage:img];
        img = [img changeImageColor:[UIColor whiteColor]];
        [cell.imageView setHighlightedImage:img];
    }

    return cell;
}
@end
