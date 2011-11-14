//
//  ViewController.m
//  Calculator
//
//  Created by vatikiot on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

//
- (CalculatorBrain *) brain 
{
    if (!brain) 
        brain = [[CalculatorBrain alloc] init];
    
    return brain;
}

//
- (void)dotPressed:(UIButton *)sender
{
    NSString *displayString = [display text];

    NSRange range = [displayString rangeOfString:@"."];
    if (range.location == NSNotFound)
    {
        [display setText:[[display text] stringByAppendingString:@"."]];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

//
- (void)piPressed:(UIButton *)sender
{
    [display setText:@"3.141592653589793"];
    [[self brain] setOperand:[[display text] doubleValue]];
}

//
- (void)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text]; 
    if (userIsInTheMiddleOfTypingANumber) 
    { 	
        [display setText:[[display text] stringByAppendingString:digit]];
    }  else {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

//
- (void)operationPressed:(UIButton *)sender
{
//    NSLog(@"The answer to %@, the universe and everything is %d.", @"life", 42);
    if (userIsInTheMiddleOfTypingANumber) 
    { 
        [[self brain] setOperand:[[display text] doubleValue]]; 
        userIsInTheMiddleOfTypingANumber = NO; 
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

//
- (void)memoryButtonPressed:(UIButton *)sender
{
    NSString *memOperation = [[sender titleLabel] text];
    [[self brain] setOperand:[[display text] doubleValue]]; 
    [[self brain] performOperation:memOperation];
    userIsInTheMiddleOfTypingANumber = NO; 
    
    if ([memOperation isEqual:@"C"])
    {
        [display setText:@"0"];
    } else if ([memOperation isEqual:@"recall"])
    {
        double memory = [[self brain] performOperation:memOperation];
        [display setText:[NSString stringWithFormat:@"%g", memory]];
    }

    double result = [[self brain] memory];
    [memoryDisplay setText:[NSString stringWithFormat:@"%g", result]];
}

@end


