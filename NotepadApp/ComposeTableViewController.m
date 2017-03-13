//
//  ComposeTableViewController.m
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import "ComposeTableViewController.h"
#import "NSString+Random.h"

@interface ComposeTableViewController ()

@end

@implementation ComposeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self customizeHeader];
    if(self.isEditable)
    {
        [self.filenameLbl setText:self.note.fileName];
        [self.noteMsg setText:self.note.notes];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customizeHeader
{
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"Compose";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItem)])
    {
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNotes:)];
  
        self.navigationItem.rightBarButtonItem = rightBarButton;
        
        
    }
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)saveNotes:(id) sender
{
    if(self.isEditable)
    {
        if([self.filenameLbl.text length]!=0)
        {
            if([self.noteMsg.text length]!=0)
            {
                NSString *uID=[NSString randomAlphanumericStringWithLength:7];
                NSMutableDictionary *dict=[NSMutableDictionary new];
                dict[@"notes"]=self.noteMsg.text;
                dict[@"fileName"]=self.filenameLbl.text;
                dict[@"uniqueID"]=uID;
                
                [[NoteManagerHelper sharedInstance ] editNotes:dict user:self.note];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Please input notes" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Please input filename" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }

    }else
    {
        if([self.filenameLbl.text length]!=0)
        {
            if([self.noteMsg.text length]!=0)
            {
                NSString *uID=[NSString randomAlphanumericStringWithLength:7];
                NSMutableDictionary *dict=[NSMutableDictionary new];
                dict[@"notes"]=self.noteMsg.text;
                dict[@"fileName"]=self.filenameLbl.text;
                dict[@"uniqueID"]=uID;
                
                [[NoteManagerHelper sharedInstance ] AddNewNote:dict];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Please input notes" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Please input filename" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
    
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
