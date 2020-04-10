//
//  ExceptionHandling.swift
//  calc
//
//  Created by Vaibhav patel on 10/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
struct ExceptionHandling {
    let errInput: String // just to hold the error value
    enum CalcError: Error { // defined each type of exception
        case InvalidInput
        case IntegerOverFlow
        case DivByZero
        case UnknowOperator
        case IncompleteExpression
    }
    // this function will handle InvalidInput Error
    func InvalidInput() {
        do{
            throw CalcError.InvalidInput
        }catch{
            print("Invalid Number \(errInput)")
            exit(1)
        }
    }
    // this function will handle IntergerOverFlow Error
    func IntergerOverFlow(){
        do {
            throw CalcError.IntegerOverFlow
        }catch{
            print("Integer Overflow: \(errInput) > \(Int.max) or \(errInput) < \(Int.min) ")
            exit(2)
        }
    }
    // this function will handle DivByZero Error
    func DivByZero(){
        do{
            throw CalcError.DivByZero
        }catch{
            print("Division by Zero")
            exit(3)
        }
    }
    // this function will handle UnknowOperator Error
    func UnknowOperator(){
        do{
            throw CalcError.UnknowOperator
        }catch{
            print("Unknown Operator \(errInput)")
            exit(4)
        }
    }
    // this function will handle IncompleteExpression Error
    func IncompleteExpression(){
        do {
            throw CalcError.IncompleteExpression
        }catch{
            print("Incomplete Expression. Expected input form is [number] [operator] [......] ")
            exit(5)
        }
    }
}
