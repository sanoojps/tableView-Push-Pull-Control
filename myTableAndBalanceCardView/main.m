//
//  main.m
//  myTableAndBalanceCardView
//
//  Created by mar Jinn on 12/24/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CQAppDelegate.h"

int main(int argc, char * argv[])
{
    int retVal = -1;
    @autoreleasepool {
        @try {
            //
            retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([CQAppDelegate class]));
        }
        @catch (NSException *exception) {
            //handler
            NSLog(@"%@\n",[exception description]);
            NSLog(@"%@\n",[exception callStackSymbols]);
        }
        @finally {
            //statements
            return retVal;
        }
        
    }
}
