//
//  ViewController.h
//  UITableViewEditAndOrder
//
//  Created by Singer on 14-6-19.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)remove:(id)sender;

- (IBAction)add:(id)sender;


@end
