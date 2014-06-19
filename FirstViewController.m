//
//  FirstViewController.m
//  EmptyApp
//
//  Created by rragrawal on 27/05/14.
//  Copyright (c) 2014 Systango. All rights reserved.
//

#import "FirstViewController.h"
#include "NextPage.h"

@interface FirstViewController ()
{
}
@end

@implementation FirstViewController
{
        NSMutableArray *tableData;
        NSArray *thumbnails;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    //cell.imageView.image=[UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int selected_row=(int)indexPath.item;
    NSString *s=[tableData objectAtIndex:selected_row];
    UIAlertView *messageAlert = [[UIAlertView alloc]initWithTitle:s  message:@"You've selected a row"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryType= UITableViewCellAccessoryDetailButton;
    
    // Display Alert Message
    [messageAlert show];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    tableData = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea",nil];
 //   thumbnails=[NSArray arrayWithObjects:@"a.jpg",@"b.jpg",nil];
    // Do any additional setup after loading the view from its nib.

    // it is used when we want to use the property list.
    //    NSString *path=[[NSBundle mainBundle] pathForResource:@"PropertyList" ofType:@"plist"] ;
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    tableData = [dict objectForKey:@"Root"];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableData removeObjectAtIndex:indexPath.row];
     [tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showMessage
{
    UIAlertView *helloWorldAlert = [[UIAlertView alloc]
                                    initWithTitle:@"My First App" message:@"Hello, World!" delegate:nil cancelButtonTitle:@"OK"   otherButtonTitles:nil ];
    
    // Display the Hello World Message
    [helloWorldAlert show];
}
-(IBAction)nextPage
{
    NextPage *contentCommentViewController = [[NextPage alloc]initWithNibName:@"NextPage" bundle:nil];
  //  [self.navigationController pushViewController:contentCommentViewController animated:YES];
  [self presentModalViewController:contentCommentViewController animated:YES];
}

    @end
