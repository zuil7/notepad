//
//  Notes.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Notes : NSManagedObject
@property (nonatomic, retain) NSString * fileName;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * uniqueID;

@end
