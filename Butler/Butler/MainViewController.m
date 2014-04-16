//
//  MainViewController.m
//  Butler
//
//  Created by Jackson on 4/15/14.
//  Copyright (c) 2014 Jackson. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController () <WitDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation MainViewController

// ================================================================================
//                            WIT - VOICE RETURN CALL
// ================================================================================

- (void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e
{
  if (e) {
    NSLog(@"[Wit] error: %@", [e localizedDescription]);
    return;
  }
  
  NSLog(@"%@", [NSString stringWithFormat:@"intent = %@", intent]);
  
}


// ================================================================================
//                            UITABLEVIEW DELEGATE METHODS
// ================================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return @"Status of Devices";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if(cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    UIView *status = [[UIView alloc] initWithFrame:CGRectMake(180, 17, 10, 10)];
    [status setBackgroundColor:[UIColor redColor]];
    [status.layer setCornerRadius:5];
    [status.layer setBorderColor:[UIColor blackColor].CGColor];
    [status.layer setBorderWidth:1];
    [status setTag:90+indexPath.row];
    [cell addSubview:status];
  }
  return cell;
}
// ================================================================================





// ================================================================================
//                              ViewDidLoad
// ================================================================================

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [Wit sharedInstance].delegate = self;
  
  // create the button
  CGRect screen = [UIScreen mainScreen].bounds;
  CGFloat w = 100;
  CGRect rect = CGRectMake(screen.size.width/2 - w/2, screen.size.height/2 - w/2, w, w);
  
  WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
  [[self.view viewWithTag:1] addSubview:witButton];
  [[self.view viewWithTag:1] bringSubviewToFront:[self.view viewWithTag:2]];
  [[self.view viewWithTag:2].layer setBorderWidth:1];
  [[self.view viewWithTag:2].layer setBorderColor:[UIColor darkGrayColor].CGColor];
  
  
  
  UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(swipeLeft)];
  [swipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
  [[self.view viewWithTag:1] addGestureRecognizer:swipeGesture];
  
  swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(swipeRight)];
  [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
  [[self.view viewWithTag:2] addGestureRecognizer:swipeGesture];
  
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(swipeRight)];
  [[self.view viewWithTag:2] addGestureRecognizer:tapGesture];
}










// =============================================================================
//                           Swipe Gestures
// =============================================================================

- (void) swipeLeft
{
  [[self.view viewWithTag:2] setHidden:false];
  
  CGRect newFrame = [self.view viewWithTag:1].frame;
  newFrame.origin.x = -200;
  
  [UIView animateWithDuration:0.2 animations:^{
    [self.view viewWithTag:1].frame = newFrame;
    [self.view viewWithTag:2].alpha = 0.7;
  }];
}

- (void) swipeRight
{
  CGRect newFrame = [self.view viewWithTag:1].frame;
  newFrame.origin.x = 0;
  
  [UIView animateWithDuration:0.2 animations:^{
    [self.view viewWithTag:1].frame = newFrame;
    [self.view viewWithTag:2].alpha = 0;
  } completion:^(BOOL finished) {
    [[self.view viewWithTag:2] setHidden:true];
  }];
}

@end
