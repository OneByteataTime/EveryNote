//
//  Note.h
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSDate * lastUpdate;

@end
