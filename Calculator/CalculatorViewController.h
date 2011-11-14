//
//  ViewController.h
//  Calculator
//
//  Created by vatikiot on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController
{
    CalculatorBrain *brain;
    IBOutlet UILabel *display;
    IBOutlet UILabel *memoryDisplay;
    BOOL userIsInTheMiddleOfTypingANumber;
}

-(IBAction)digitPressed:(UIButton *)sender;
-(IBAction)dotPressed:(UIButton *)sender;
-(IBAction)operationPressed:(UIButton *)sender;
-(IBAction)memoryButtonPressed:(UIButton *)sender;
-(IBAction)piPressed:(UIButton *)sender;

@end
