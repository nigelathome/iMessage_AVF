//
//  AppDelegate.h
//  iMessage_AVF
//
//  Created by Nigel Lee on 26/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *vc;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

