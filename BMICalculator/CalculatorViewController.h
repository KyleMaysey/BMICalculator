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
    BOOL isMetric;  //Flag used to determine whether values are US customary or Metric
}

@property (weak, nonatomic) IBOutlet UITextField *heightValue;  //Textbox for entering height
@property (weak, nonatomic) IBOutlet UITextField *weightValue;  //Textbox for entering weight
@property (weak, nonatomic) IBOutlet UILabel *heightUnit;       //Unit label of height
@property (weak, nonatomic) IBOutlet UILabel *weightUnit;       //Unit label of weight
@property (weak, nonatomic) IBOutlet UILabel *bmiResult;        //Label to show result of calculation
@property (weak, nonatomic) IBOutlet UIImageView *imageResult;  //Outlet for image viewer

//Purpose:  Action called by segment control.
//          Toggles the units the calculation & the display labels of the units.
-(IBAction)UnitToggle:(UISegmentedControl *)sender;

//Purpose:  Action called by Calculate button.
//          Performs the calculation for BMI, checks unit flag.  Does conversion on US customary units.
-(IBAction)CalculateBMI:(UIButton *)sender;

@end
