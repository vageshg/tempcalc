//
//  TempViewController.h
//  TempCalc
//
//  Created by Vagesh G. on 8/10/13.
//  Copyright (c) 2013 Vagesh G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *fahrenheit;
@property (strong, nonatomic) IBOutlet UITextField *celsius;

//- (IBAction)convert:(id)sender;
-(IBAction)onDoneButton;

@end
