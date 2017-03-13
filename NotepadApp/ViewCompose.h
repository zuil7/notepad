//
//  ViewCompose.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notes.h"

@interface ViewCompose : UIViewController

@property(strong,nonatomic) Notes *note;
@property (weak, nonatomic) IBOutlet UITextView *noteText;
@end
