//
//  CalculatorBrain.h
//  Calculator
//
//  Created by vatikiot on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
    double operand;
    double memory;
    
    double waitingOperand;
    NSString *waitingOperation;
}

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
- (double)memory;
@end
