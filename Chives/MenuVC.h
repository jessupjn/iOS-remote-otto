//
//  DEMOMenuViewController.h
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@protocol MenuVCDelegate <NSObject>
@required
-(void)didSelectMenuItem:(NSString*)title;
@optional
@end


@interface MenuVC : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) id<MenuVCDelegate> delegate;
@end
