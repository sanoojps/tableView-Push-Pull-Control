//
//  CQPTFTableViewController.h
//  myTableAndBalanceCardView
//
//  Created by mar Jinn on 12/24/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CQPTFTableViewController;

@protocol TableScroll <NSObject>

-(void)tableHasScrolled:(NSString *)direction andAdjustTableview:(CQPTFTableViewController *)CQPTFTableView;

@end

@interface CQPTFTableViewController : UITableViewController

{
    NSArray* dataSourceArray;
    id delegate;
}

@property(nonatomic,retain)NSArray* dataSourceArray;

@property(nonatomic,assign)id<TableScroll> delegate;
@end
