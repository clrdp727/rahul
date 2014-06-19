//
//  FirstViewController.h
//  EmptyApp
//
//  Created by rragrawal on 27/05/14.
//  Copyright (c) 2014 Systango. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

-(IBAction) nextPage;
-(IBAction)showMessage;
@end
