//
//  ComposeTableViewController.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notes.h"

@interface ComposeTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *filenameLbl;
@property (weak, nonatomic) IBOutlet UITextView *noteMsg;
@property (assign, nonatomic) BOOL isEditable;
@property(strong,nonatomic) Notes *note;

@end
