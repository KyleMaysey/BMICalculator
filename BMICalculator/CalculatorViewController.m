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

#define convertInchesToMetric .0254     //Constant for conversion of inches to meters
#define convertPoundsToMetric .453592   //Constant for conversion of pounds to kilograms
#define _SeverlyThin 16.00              //Constant for determining "severly thin" range
#define _ModeratelyThin 17.00           //Constant for determining "moderately thin" range
#define _MildlyThin 18.5                //Constant for determining "mildy thin" range
#define _Normal 25.00                   //Constant for determining "normal" range
#define _Overweight 30.00               //Constant for determining "overweight" range
#define _ModerateObesity 35.00          //Constant for determining "moderately obese" range
#define _SeverObesity 40.00             //Constant for determining "severly obese" range

//Purpose:  Action called by segment control.
//          Toggles the units the calculation & the display labels of the units.
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

//Purpose:  Action called by Calculate button.
//          Performs the calculation for BMI, checks unit flag.  Does conversion on US customary units.
-(IBAction)CalculateBMI:(UIButton *)sender
{
    double BMIVal;      //Temporary value to store BMI calculation result
    
    //Perform calculation, converts units if US customary measurements
    if (isMetric)
    {
        BMIVal = [self.weightValue.text doubleValue]/([self.heightValue.text doubleValue] * [self.heightValue.text doubleValue] * .0001);
    }
    else
    {
        BMIVal = ([self.weightValue.text doubleValue] * convertPoundsToMetric) / ([self.heightValue.text doubleValue] * convertInchesToMetric * [self.heightValue.text doubleValue] * convertInchesToMetric);
    }
    
    self.bmiResult.text = [NSString stringWithFormat:@"%f", BMIVal];        //Set result labels text
    
    NSBundle* myBundle	= [NSBundle mainBundle];                            //Create bundle for files
    NSString* imagePath;
    
    //Finds path of image file for BMI category
    if (BMIVal < _SeverlyThin)
    {
        imagePath = [myBundle pathForResource:@"SevereThin" ofType:@"png"];
    }
    else if (BMIVal < _ModeratelyThin)
    {
        imagePath = [myBundle pathForResource:@"ModThin" ofType:@"png"];
    }
    else if (BMIVal < _MildlyThin)
    {
        imagePath = [myBundle pathForResource:@"MildThin" ofType:@"png"];
    }
    else if (BMIVal < _Normal)
    {
        imagePath = [myBundle pathForResource:@"Normal" ofType:@"png"];
    }
    else if (BMIVal < _Overweight)
    {
        imagePath = [myBundle pathForResource:@"Over" ofType:@"png"];
    }
    else if (BMIVal < _ModerateObesity)
    {
        imagePath = [myBundle pathForResource:@"ModObes" ofType:@"png"];
    }
    else if (BMIVal < _SeverObesity)
    {
        imagePath = [myBundle pathForResource:@"SevObes" ofType:@"png"];
    }
    else
    {
        imagePath = [myBundle pathForResource:@"VSevObes" ofType:@"png"];
    }
    
    self.imageResult.image = [UIImage imageWithContentsOfFile:imagePath];   //Set image
    
    //NSLog(@"BMIValue: %f", BMIVal);
}


//Purpose:  Remove numerical keypad when user touches main view
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.heightValue resignFirstResponder];
    [self.weightValue resignFirstResponder];
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
