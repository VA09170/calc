//
//  Validate.swift
//  calc
//
//  Created by Vaibhav patel on 10/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
// this struct is used to check validation of the Exp.
struct  Validate {
    let args : [String]
    let index = 0
    // this function will check Input is valid or not
    func checkForValidInput(){
        // if thg count of arg % 2 and return 0 then it might be a IncompleteExpression
        if(args.count % 2 == 0){
            ExceptionHandling(errInput: "").IncompleteExpression()
        }
        // if the argument is nil or 1 then InvalidInput
        if (args.count == 1 && Int(args[0]) == nil){
            ExceptionHandling(errInput: args[index]).InvalidInput()
        }
        // check for opt every two step
        for index in stride(from: 0, to: args.count-2, by: 2){
            if Int(args[index]) == nil{
                ExceptionHandling(errInput: args[index]).InvalidInput()
            }
        }
        
        // check any of the number is OUT Bounded.
        isOutOfBound()
    }
    
    // this will check number is OUT Bounded or NOT
    func isOutOfBound(){
        for index in stride(from: 0, to: args.count, by: 1){
            if let IntegerSize = Int(args[index]){
                // if the numebr is bigger than max or lower than min of INT32 then it will gen error.
                if IntegerSize > Int.max || IntegerSize < Int.min{
                    ExceptionHandling(errInput: (args.joined(separator: " "))).IntergerOverFlow()
                }
            }
        }
    }
}
