//
//  TempViewController.m
//  TempCalc
//
//  Created by Vagesh G. on 8/10/13.
//  Copyright (c) 2013 Vagesh G. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

-(void)convertToCelsius;
-(void)convertToFahrenheit;

@property int prog;


@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.fahrenheit.delegate = self;
    self.celsius.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UITextField delegate
- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
        return YES;
    //[self updateValues];
}


#pragma mark - Private Methods

-(void)onDoneButton {
    [self.view endEditing:YES];
    
}

-(void)convertToCelsius {
    float fah = [self.fahrenheit.text floatValue];
    float cel = (fah - 32.0f) * 5.0f / 9.0f;
    self.celsius.text = [NSString stringWithFormat:@"%0.2f", cel];
}

-(void)convertToFahrenheit {
    float cel = [self.celsius.text floatValue];
    float fah_val = (cel * 9/5) + 32;
    self.fahrenheit.text = [NSString stringWithFormat:@"%0.2f", fah_val];

    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {

    if (textField.tag == 1) {
        self.prog = 1;
        
    }
    else {
        self.prog = 2;
    }
}


- (IBAction)convert:(id)sender {
    NSLog(@"prog %d", self.prog);
    if (self.prog == 1) {
        [self convertToCelsius];
    }
    else {
    [self convertToFahrenheit];
    }

}
@end
