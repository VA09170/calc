//
//  Calculator.swift
//  calc
//
//  Created by Vaibhav patel on 7/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
class Calculator{
    // init function.
    func calculate(args: [String]) -> String {
        // assign the args values to local stack to perform faster operation
        var localStack: [String] = args
        // irrate until lockstack reach to one value
        while(localStack.count != 1){
            // check for the first pair of operation
         let tempStack = findFirstOperation(args: localStack)
            // FindFirstOperation() will return the array and index postion of LHS RHS and OPT
            let lhs = Int(tempStack.temparray[0])!
            let rhs = Int(tempStack.temparray[1])!
            let opt = tempStack.temparray[2]
            // Call the Calc() to perform the operation
            let dummyrhs = Calc(lhs: lhs, rhs: rhs, opt: opt)
            // Calc() function will return two value are string and Bool
            // if dummyrhs.update is true then it will remove all the three variable from the stack and insert the lastest result to last updated location.
            // in my case each and every time the value is going to reomve from LHS index  postition and inserted back to same postion.
            if(dummyrhs.update){
                for _ in 1...tempStack.temparray.count{
                    localStack.remove(at: tempStack.lhsindex)
                }
                // add new value to stack
                localStack.insert(dummyrhs.Result, at: tempStack.lhsindex)
            }
        }
        // return the first element of the stack
        return String(localStack[0])
    }// end Function
    
    
    func findFirstOperation(args: [String]) -> (temparray:[String] , lhsindex:Int, rhsindex :Int , optindex: Int) {
        // array used to store lhs, rhs and opt
        var temparray: [String] = []
        var lhsindex: Int = 0
        var rhsindex: Int = 0
        var optindex: Int = 0
        
        for i in 0...args.count-1{
            //check number is Int then do nothing
            if Int(args[i]) != nil{
                // if i assgin this one then it will aslo take the value of the starting postion
            }
            // if number is Double do nothing..
            else if Double(args[i]) != nil{
                
            }
            // when any string value(Opt) found at that time it will do following
            else{
                optindex = i // index of opt
                lhsindex = i - 2 // index of lhs (-2) from opt index
                rhsindex = i - 1 // index of rhs (-1) from opt index
                //appends values to local temparray
                temparray.append(args[i-2])
                temparray.append(args[i-1])
                temparray.append(args[i])
                break
            }
        }
        // return current array and index of LHS RHS and OPT
        return (temparray, lhsindex, rhsindex, optindex)
    }
        
    
    func Calc(lhs: Int, rhs: Int, opt:String) -> (Result: String, update:Bool) {
        var dummpyresult:String? // hold per. result and make rhs
        // check DivByZero
        if ((opt == "/" || opt == "%") && rhs == 0){
            ExceptionHandling(errInput: "").DivByZero()
        }
        
        switch opt {
        case "^":
            dummpyresult = String(power(lhs: lhs, rhs: rhs))
            break
        case "%":
            dummpyresult = String(mod(lhs: lhs, rhs: rhs))
            break
        case "*", "x", "X":
            dummpyresult = String(mul(lhs: lhs, rhs: rhs))
            break
        case "/":
            dummpyresult = String(div(lhs: lhs, rhs: rhs))
            break
        case "+":
            dummpyresult = String(add(lhs: lhs, rhs: rhs))
            break
        case "-":
            dummpyresult = String(sub(lhs: lhs, rhs: rhs))
        default:
            ExceptionHandling(errInput: opt).UnknowOperator()
        }
        //also check the result isOutOfBound() or not result > Int.max and result < Int.min
        Validate(args: ["\(dummpyresult!)"]).isOutOfBound()
        return (dummpyresult!, true)
    }
    
    // this function will add two Int
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    // this function will sub two Int
    func sub(lhs: Int , rhs : Int) -> Int{
        return lhs - rhs
    }
    // this function will power two Int
    func power(lhs : Int, rhs: Int) -> Int{
        return lhs ^ rhs
    }
    // this function will mult two Int
    func mul(lhs: Int, rhs: Int) -> Int{
        return lhs * rhs
    }
    // this function will div two Int
    func div(lhs: Int, rhs: Int) -> Int{
        return lhs / rhs
    }
    // this function will mod two Int
    func mod(lhs: Int, rhs: Int) -> Int{
        return lhs % rhs
    }
}
