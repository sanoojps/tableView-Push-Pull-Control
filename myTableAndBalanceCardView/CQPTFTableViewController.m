//
//  CQPTFTableViewController.m
//  myTableAndBalanceCardView
//
//  Created by mar Jinn on 12/24/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "CQPTFTableViewController.h"

#define REFRESH_HEADER_HEIGHT 52.0f

@interface CQPTFTableViewController ()
{
    UIView *refreshHeaderView;
    UILabel *refreshLabel;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isDragging;
    BOOL isLoading;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
}

@property (nonatomic, retain) UIView *refreshHeaderView;
@property (nonatomic, retain) UILabel *refreshLabel;
@property (nonatomic, retain) UIImageView *refreshArrow;
@property (nonatomic, retain) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, copy) NSString *textPull;
@property (nonatomic, copy) NSString *textRelease;
@property (nonatomic, copy) NSString *textLoading;

@end

@implementation CQPTFTableViewController

@synthesize dataSourceArray;

@synthesize textPull, textRelease, textLoading, refreshHeaderView, refreshLabel, refreshArrow, refreshSpinner;

@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self != nil) {
        [self setupStrings];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self setupStrings];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self != nil) {
        [self setupStrings];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupStrings];

}

- (void)setupStrings{
    [self setDataSourceArray:[NSArray
                              arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil]];
    
    //NSLog(@"%@",[self dataSourceArray]);

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataSourceArray] ? [[self dataSourceArray]count] : 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell *cell = nil;
    
    id tempVarForCell = nil;
    tempVarForCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];//returns id
    

    if ( (tempVarForCell) && [tempVarForCell isKindOfClass:[UITableViewCell class]])
    {
        cell = (UITableViewCell *)tempVarForCell;
    }//isKindOfClass
    
  
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:CellIdentifier]autorelease];
    }
    
    //if (cell)
    //{
        //get values from dataSource
        if ([self dataSourceArray])
        {
            if ([[self dataSourceArray]objectAtIndex:[indexPath row]] &&
                [[[self dataSourceArray]objectAtIndex:[indexPath row]] isKindOfClass:[NSString class]])
            {
                ///statements
                [[cell textLabel]setText:[[self dataSourceArray]objectAtIndex:[indexPath row]]];
            }
        }
        
        
    //}
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
    /*
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (nil == cell) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:CellIdentifier]autorelease];
//    }
//    
//    // Do something to cell
//    
//    [[cell textLabel]setText:@"[[self dataSourceArray]objectAtIndex:[indexPath row]]"];
//    
//    return cell;

//    static NSString *CellIdentifier = @"CellIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
//    
//    cell.textLabel.text = [dataSourceArray objectAtIndex:indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    return cell;
     
     
     */

}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    }

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (isLoading) return;
    isDragging = NO;
    if (scrollView.contentOffset.y <= -REFRESH_HEADER_HEIGHT) {
        // Released above the header
        
    }
    
    if (scrollView.contentOffset.y < 0)
    {
        NSLog(@"Move UP");
        if ([[self delegate]respondsToSelector:@selector(tableHasScrolled:andAdjustTableview:)])
        {
            [[self delegate]tableHasScrolled:@"UP" andAdjustTableview:self];
        }
    }
    else
    {
        NSLog(@"Move DOWN");
        if ([[self delegate]respondsToSelector:@selector(tableHasScrolled:andAdjustTableview:)])
        {
            [[self delegate]tableHasScrolled:@"DOWN" andAdjustTableview:self];
        }
    }

    
}


@end
