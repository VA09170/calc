//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program


Validate(args: args).checkForValidInput() // check the given input is valid or not
// when signle value present then just print that values as answer
if args.count == 1{
    print(Int(args[0])!)
}
// if the array have more than 2 value then perform operation
if args.count > 2{
    let rules = Rules() // Rules class object
    // convert the given infix notation to postfix notation
    let PostfixExpression = rules.InfixToPostfix(tokens: args)

    let cal = Calculator() // calculator class object
    // perform operation based on postfix expression
    let FinalResult = cal.calculate(args: PostfixExpression)
    //print the final output.
    print(FinalResult)
}
