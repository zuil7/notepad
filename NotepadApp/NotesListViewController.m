//
//  NotesListViewController.m
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import "NotesListViewController.h"
#import "ComposeTableViewController.h"
#import "Notes.h"
#import "ViewCompose.h"

@interface NotesListViewController ()
@property (nonatomic,strong) NSArray *arrNotes;
@end

@implementation NotesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self customizeHeader];
    
   
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.arrNotes=[[NoteManagerHelper sharedInstance ] getNotes];
    [self.tableView reloadData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customizeHeader
{
    [self.navigationController setNavigationBarHidden:NO];

    self.navigationItem.title = @"List of Notes";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItem)])
    {
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNotes:)];
            self.navigationItem.rightBarButtonItem = rightBarButton;
            
            
    }
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)addNotes:(id) sender
{
    ComposeTableViewController *compose=[GlobalInstance loadStoryBoardId:SB_compose];
    [self.navigationController pushViewController:compose animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrNotes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Notes *note =(Notes *)[self.arrNotes objectAtIndex:indexPath.row];
    [cell.textLabel setText:note.fileName];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewCompose *viewNotes =[GlobalInstance loadStoryBoardId:SB_viewcompose];
    viewNotes.note =(Notes *)[self.arrNotes objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewNotes animated:YES];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Notes *note=(Notes *)[self.arrNotes objectAtIndex:indexPath.row];
        [[NoteManagerHelper sharedInstance ] deleteCategory:note];
        self.arrNotes=[[NoteManagerHelper sharedInstance ] getNotes];
        [self.tableView reloadData];

//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
