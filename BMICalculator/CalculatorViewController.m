//
//  CalculatorViewController.m
//  BMICalculator
//
//  Created by SaintD on 2/18/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

-(IBAction)UnitToggle:(UISegmentedControl *)sender
{
    //NSLog(@"Selected index: %d", [sender selectedSegmentIndex]);
    
    //Toggle between Metric and US Customary units
    if ([sender selectedSegmentIndex])
    {
        isMetric = YES;
        self.heightUnit.text = @"cm";
        self.weightUnit.text = @"kg";
    }
    else
    {
        isMetric = NO;
        self.heightUnit.text = @"inch";
        self.weightUnit.text = @"lbs";
    }
}

-(IBAction)ClearKeyboard:(UIButton *)sender
{
    [self.heightValue resignFirstResponder];
    [self.weightValue resignFirstResponder];
}

-(IBAction)CalculateBMI:(UIButton *)sender
{
    double BMIVal;
    BMIVal = [self.weightValue.text doubleValue]/([self.heightValue.text doubleValue] * [self.heightValue.text doubleValue]);
    
    NSLog(@"BMIValue: %f", BMIVal);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isMetric = NO;      //Initilize isMetric toggle to false; Default US customary
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
