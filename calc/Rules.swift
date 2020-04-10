//
//  Rules.swift
//  calc
//
//  Created by Vaibhav patel on 8/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation
class Rules{
    let opt = [
        "^": (prec:4, rAssoc: true),
        "*": (prec:3, rAssoc: false),
        "/": (prec:3, rAssoc: false),
        "+": (prec:2, rAssoc: false),
        "-": (prec:2, rAssoc: false),
    ]
    
    func checkrules(args: [String]) -> (String,Int){
        var selfincremen = 0
        var operatotoreturn: String = ""
        var indexpos = 0
        print("args from rule \(args)")
        for i in 0...args.count-1{
            selfincremen = i + 1
            if(i == 0){
                operatotoreturn = args[i]
                indexpos = i
            }
            if(selfincremen <= args.count-1){
                if (opt[args[i]]!.prec > opt[args[selfincremen]]!.prec || opt[args[selfincremen]]!.prec == opt[args[i]]!.prec){
                    operatotoreturn = args[i]
                    indexpos = i
                    }
                else if(opt[args[selfincremen]]!.prec > opt[args[i]]!.prec || opt[args[selfincremen]]!.prec == opt[args[i]]!.prec){
                    operatotoreturn = args[selfincremen]
                    indexpos = selfincremen
                }
                else if(opt[args[i]]!.prec < opt[args[selfincremen]]!.prec || opt[args[selfincremen]]!.prec == opt[args[i]]!.prec){
                    operatotoreturn = args[i]
                    indexpos = i
                    }
            }else{
                print("value reached to \(selfincremen)")
            }
        }
        return (operatotoreturn, indexpos)
}
}
