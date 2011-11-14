//
//  CalculatorBrain.m
//  Calculator
//
//  Created by vatikiot on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



#import "CalculatorBrain.h"

@implementation CalculatorBrain

//
- (void)setOperand:(double)anOperand
{
    operand = anOperand;
}

//
- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) 
    {
        operand = waitingOperand + operand;
    } 
    else if ([@"-" isEqual:waitingOperation]) 
    {
        operand = waitingOperand - operand;
    } 
    else if ([@"*" isEqual:waitingOperation]) 
    {
        operand = waitingOperand * operand;
    }                
    else if ([@"/" isEqual:waitingOperation]) 
    {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

// 
- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"])
    {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"1/x"])
    {
        operand = 1 / operand;
    } else if ([operation isEqual:@"sin"])
    {
        operand = sin(operand);
    } else if ([operation isEqual:@"cos"])
    {
        operand = cos(operand);
    } else if ([operation isEqual:@"-/+"])
    {
        operand = -operand;
    } else if ([operation isEqual:@"C"]) 
    {
        memory = 0;
        operand = 0;
        waitingOperand = 0;
    } else if ([operation isEqual:@"mem+"]) 
    {
        memory = memory + operand;
    } else if ([operation isEqual:@"store"]) 
    {
        memory = operand;
    } else if ([operation isEqual:@"recall"]) 
    {
        operand = memory;
    }
    else {
        [self performWaitingOperation];
        waitingOperand = operand;
        waitingOperation = operation;
    }
    
    return operand;
}

- (double) memory
{
    return memory;
}

@end
