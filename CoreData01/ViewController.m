//
//  ViewController.m
//  CoreData01
//
//  Created by onlyou1991 on 16/7/15.
//  Copyright © 2016年 onlyou1991. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Dog.h"
@interface ViewController ()
{
    AppDelegate *app;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = [UIApplication sharedApplication].delegate;
   
}
/**
 *  增加数据insert
 */
- (IBAction)add:(id)sender {
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:app.managedObjectContext];
    dog.name = @"花花1";
    dog.number = @"010100";
    dog.age = @"12";
    NSError *error = nil;
    [app.managedObjectContext save:&error];
    NSLog(@"插入数据成功");
}
/**
 *  查询
 */
- (IBAction)select:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:app.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    NSArray *array =  [app.managedObjectContext executeFetchRequest:request error:nil];
    for (Dog *dog in array) {
        NSLog(@"%@",dog.name);
    }

}

/**
 *删除
 */
- (IBAction)delete:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:app.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"花花"];
    [request setPredicate:predicate];
    
    NSArray *ary =  [app.managedObjectContext executeFetchRequest:request error:nil];
    if (ary.count) {
        for (Dog *dog in ary) {
            [app.managedObjectContext deleteObject:dog];
        }
        [app.managedObjectContext save:nil];
        NSLog(@"删除完成");
    }else{
        NSLog(@"没有查询到数据");
    }

}
/**
 *  更新
 */
- (IBAction)update:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription  entityForName:@"Dog" inManagedObjectContext:app.managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"花花1"];
    [request setPredicate:predicate];
    
    NSArray *ary = [app.managedObjectContext executeFetchRequest:request error:nil];
    if (ary.count) {
        for (Dog *dog in ary) {
            dog.name = @"大黄";
            [app.managedObjectContext updatedObjects];
        }
        [app.managedObjectContext save:nil];
        NSLog(@"修改完成");
    }else{
        NSLog(@"没有查询到数据");
    }

}

@end

































