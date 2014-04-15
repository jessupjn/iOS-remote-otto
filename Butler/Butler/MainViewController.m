//
//  MainViewController.m
//  Butler
//
//  Created by Jackson on 4/15/14.
//  Copyright (c) 2014 Jackson. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController () <WitDelegate>

@end

@implementation MainViewController

- (void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e
{
  if (e) {
    NSLog(@"[Wit] error: %@", [e localizedDescription]);
    return;
  }
  
  NSLog(@"%@", [NSString stringWithFormat:@"intent = %@", intent]);
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [Wit sharedInstance].delegate = self;
  
  // create the button
  CGRect screen = [UIScreen mainScreen].bounds;
  CGFloat w = 100;
  CGRect rect = CGRectMake(screen.size.width/2 - w/2, 60, w, 100);
  
  WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
  [[self.view viewWithTag:1] addSubview:witButton];
  [[self.view viewWithTag:1] bringSubviewToFront:[self.view viewWithTag:2]];

  UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
  [swipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
  [[self.view viewWithTag:1] addGestureRecognizer:swipeGesture];
  
  swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
  [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
  [[self.view viewWithTag:2] addGestureRecognizer:swipeGesture];
  
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
  [[self.view viewWithTag:2] addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) swipeLeft
{
  [[self.view viewWithTag:2] setHidden:false];
  
  CGRect newFrame = [self.view viewWithTag:1].frame;
  newFrame.origin.x = -160;
  
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
