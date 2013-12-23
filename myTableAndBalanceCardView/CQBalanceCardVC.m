//
//  CQBalanceCardVC.m
//  myTableAndBalanceCardView
//
//  Created by mar Jinn on 12/24/13.
//  Copyright (c) 2013 mar Jinn. All rights reserved.
//

#import "CQBalanceCardVC.h"

#import "CQPTFTableViewController.h"



#define NAVIGATION_BAR_HEIGHT       44.0
#define STATUS_BAR_HEIGHT           20.0

@interface CQBalanceCardVC ()
{
    CQPTFTableViewController* cQPTF_TableViewController;
    UIImageView* balanceImageView;
}

//@property(nonatomic,retain)CQPTFTableViewController* cQPTF_TableViewController;

@end

@implementation CQBalanceCardVC

//@synthesize cQPTF_TableViewController;

- (id)init
{
    self = [super init];
    if (self) {
        //initializations
    }
    return self;
}

- (void)viewDidLoad
{
    /*###############*/
    /*######## IMAGEVIEW SETUP ##########*/
    /*###############*/
    
    balanceImageView = [[UIImageView alloc]init];
    
    //set Image View's frame
    CGRect BCImgRect;
    BCImgRect =
    CGRectMake(0.0,
               [[[self navigationController]navigationBar]frame].size.height +
               [[UIApplication sharedApplication]statusBarFrame].size.height,
               [[UIScreen mainScreen]bounds].size.width,
               ([[UIScreen mainScreen]bounds].size.height)/4.0
               );
    [balanceImageView setFrame:BCImgRect];
    
    //set Image Views frame
    [balanceImageView setImage:[UIImage
                                imageNamed:@"titanium_card_landingpage.png"]];
    
    //add imageView as the viewcontrollers subview
    [[self view]addSubview:balanceImageView];
    
    
    
    /*###############*/
    /*########## TABLEVIEW SETUP ############*/
    /*###############*/
    //CQPTFTableViewController* CQPTF_TableViewController = nil;
    cQPTF_TableViewController = [[CQPTFTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    //set tableView's frame
    CGRect CQPTF_TableViewCRect;
    CQPTF_TableViewCRect =
    CGRectMake(0.0,
               NAVIGATION_BAR_HEIGHT + STATUS_BAR_HEIGHT +
               [balanceImageView frame].size.height,
               [[UIScreen mainScreen]bounds].size.width,
               ([[UIScreen mainScreen]bounds].size.height - NAVIGATION_BAR_HEIGHT -
                STATUS_BAR_HEIGHT - [balanceImageView frame].size.height)
               );
    [[cQPTF_TableViewController tableView] setFrame:CQPTF_TableViewCRect];
    
    //add tableView as subview
    [[self view]addSubview:[cQPTF_TableViewController tableView]];
    
    //release tableView
    //[CQPTF_TableViewController release];
    
    //release ImageView
    [balanceImageView release];
    //[[self view]setBackgroundColor:[UIColor greenColor]];
    
    
    //set delegate
    [cQPTF_TableViewController setDelegate:self];
    
    
}

#pragma mark
#pragma mark CQPTFTableViewController

-(void)tableHasScrolled:(NSString *)direction andAdjustTableview:(CQPTFTableViewController *)CQPTFTableView
{
    if ([direction isEqualToString:@"UP"]) {
        //statements
        [balanceImageView setFrame:CGRectMake(0.0, 0.0, 320.0, 35.0)];
    }
    else if ([direction isEqualToString:@"DOWN"]){
        //statements
        if ([balanceImageView frame].size.height == 35.0) {
            //statements
            [balanceImageView setFrame:CGRectMake(0.0, 0.0, 320.0, 55.0)];
            [[CQPTFTableView tableView]setFrame:CGRectMake(0.0, 0.0, 320.0, 55.0)];
        }
    }
}

- (void)dealloc
{
    //deallocations
    [cQPTF_TableViewController release];
    
    [super dealloc];
}


@end
