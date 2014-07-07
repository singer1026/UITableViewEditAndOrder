//
//  ViewController.m
//  UITableViewEditAndOrder
//
//  Created by Singer on 14-6-19.
//  Copyright (c) 2014年 Singer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *mydata;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _mydata = [NSMutableArray array];
    for (int i = 0; i<30; i++) {
        [_mydata addObject:[NSString stringWithFormat:@"test-%d",i]];
    }
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mydata.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = _mydata[indexPath.row];
    
    return cell;
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.tableView.tag;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle  == UITableViewCellEditingStyleDelete) {
        [_mydata removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
    }else if(editingStyle  == UITableViewCellEditingStyleInsert){
        
        NSIndexPath *newindexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [_mydata insertObject:@"new cell" atIndex:newindexPath.row ];
        [tableView insertRowsAtIndexPaths:@[newindexPath]  withRowAnimation:UITableViewRowAnimationTop];
    }
}


#pragma mark 编辑模式下排序
-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *text = _mydata[sourceIndexPath.row];
    [_mydata removeObjectAtIndex:sourceIndexPath.row];
    [_mydata insertObject:text atIndex:destinationIndexPath.row];
    
}


- (IBAction)remove:(id)sender {
    self.tableView.tag = UITableViewCellEditingStyleDelete;
    BOOL edit = self.tableView.editing;
    [self.tableView setEditing:!edit animated:YES];
}

- (IBAction)add:(id)sender {
    self.tableView.tag = UITableViewCellEditingStyleInsert;
    BOOL edit = self.tableView.editing;
    [self.tableView setEditing:!edit animated:YES];
}
@end
