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
  [self.view addSubview:witButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
