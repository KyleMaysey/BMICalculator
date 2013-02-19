//
//  CalculatorViewController.h
//  BMICalculator
//
//  Created by SaintD on 2/18/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
{
    BOOL isMetric;
}

@property (weak, nonatomic) IBOutlet UITextField *heightValue;
@property (weak, nonatomic) IBOutlet UITextField *weightValue;
@property (weak, nonatomic) IBOutlet UILabel *heightUnit;
@property (weak, nonatomic) IBOutlet UILabel *weightUnit;


-(IBAction)UnitToggle:(UISegmentedControl *)sender;
-(IBAction)CalculateBMI:(UIButton *)sender;
-(IBAction)ClearKeyboard:(UIButton *)sender;

@end
