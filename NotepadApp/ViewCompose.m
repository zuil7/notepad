//
//  ViewCompose.m
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import "ViewCompose.h"
#import "ComposeTableViewController.h"

@interface ViewCompose ()

@end

@implementation ViewCompose

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customizeHeader];
    [self.noteText setText:self.note.notes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)customizeHeader
{
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = self.note.fileName;
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItem)])
    {
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editNotes:)];
        
        self.navigationItem.rightBarButtonItem = rightBarButton;
        
        
    }
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)editNotes:(id) sender
{
    ComposeTableViewController *compose=[GlobalInstance loadStoryBoardId:SB_compose];
    compose.isEditable = YES;
    compose.note = self.note;
    [self.navigationController pushViewController:compose animated:YES];

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
