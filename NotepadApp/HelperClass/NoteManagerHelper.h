//
//  NoteManagerHelper.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteManager.h"
#import "Notes.h"

@interface NoteManagerHelper : NSObject
+ (NoteManagerHelper *)sharedInstance;
- (void)AddNewNote:(NSDictionary *)params;
- (NSArray *)getNotes;
- (void)editNotes:(NSDictionary *)params user:(Notes *)note;
- (void)deleteCategory:(Notes *)obj;

@end
