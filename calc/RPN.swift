//
//  RPN.swift
//  calc
//
//  Created by Vaibhav patel on 10/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
class Rules{
    // define rules and there prec. value
    let optRules = [
        "^": (prec:4, rAssoc:true),
        "%": (prec:3, rAssoc:false),
        "*": (prec:3, rAssoc:false),
        "x": (prec:3, rAssoc:false),
        "/": (prec:3, rAssoc:false),
        "+": (prec:2, rAssoc:false),
        "-": (prec:2, rAssoc:false),
    ]
    
    // this function will convert Infix to PostFix
    func InfixToPostfix(tokens: [String]) -> [String] {
        var rpn: [String]  = [] // empty stack to hold the value
        var stack: [String] = [] // Empty stack to hold the value

        for tok in tokens{
            //check every token in array
            switch tok {
            // if stack if nil then it will exit
            case nil:
                print("Stack is Empty")
                exit(10)
                break
            
            default:
                if let o1 = optRules[tok]{ // unwrape every token one by one
                    for op in stack.reversed(){ // loop till OPT
                        if let o2 = optRules[op]{ // unwrape other token.
                            //check prec value of both token and both are same then check Assoc..
                            if !(o1.prec > o2.prec || (o1.prec == o2.prec && o1.rAssoc)){
                                rpn += [stack.removeLast()] // push the last item of stack into rpn
                            }// check If End
                        }// inner if End
                        break
                    }// for End
                    stack += [tok] // push token to stack
                }// outter if end
                else{
                    if Int(tok) != nil{
                        rpn += [tok] // push token to stack
                    }else{//if not OPT then gene.. Error
                        ExceptionHandling(errInput: tok).UnknowOperator()
                    }
                }
            }
        }
        // return both array.
        return rpn + stack.reversed()
    }
}
