//
//  Dog+CoreDataProperties.h
//  CoreData01
//
//  Created by onlyou1991 on 16/7/15.
//  Copyright © 2016年 onlyou1991. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dog (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *age;
@property (nullable, nonatomic, retain) NSString *number;

@end

NS_ASSUME_NONNULL_END
