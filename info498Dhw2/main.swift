//
//  main.swift
//  info498Dhw2
//
//  Created by Joshua Hall on 4/4/16.
//  Copyright © 2016 Joshua Hall. All rights reserved.
//

import Foundation

//factorial function
func fact(number: Int) -> (Int) {
    if (number <= 1) {
        return 1
    }
    
    return number * fact(number - 1)
}

//always prompts user until program is existed
while(true){
    var calcStack: [String] = []; //the numbers and operations used for computing
    
    //first prompt (it will always be either a number or an invalid repsonse)
    print("Enter an expression separated by returns:\n")
    var response = readLine(stripNewline: true)!
    if let num = Int(response) {
        calcStack.append(response);
    }
    else{
        print("invalid response: Please enter a number before an operation")
        break
    }
    
    
    //second prompt (will always be either an operation, number, factorial or invalid response)
    var isOperation = false;
    response = readLine(stripNewline: true)!
    if response == "+" || response == "-" || response == "*" || response == "/"  || response == "%" {
        isOperation = true;
        calcStack.append(response);
    }
    else if response == "fact"{
        print(fact(Int(calcStack[0])!))
        continue
    }
    else{
        if let num = Int(response){
            calcStack.append(response)
        }
        else{
            print("invalid response")
            break
        }
    }
    
    //third prompt
    
    //if the second input was an operation, the next input will be used to complete the computation.
    if(isOperation){
    
        response = readLine(stripNewline: true)!
        if let num = Int(response) {
            switch(calcStack[1]) {
                case "+":
                    print(Int(calcStack[0])! + num)
                case "-":
                    print(Int(calcStack[0])! - num)
                case "*":
                    print(Int(calcStack[0])! * num)
                case "/":
                    print(Int(calcStack[0])! / num)
                case "%":
                    print(Int(calcStack[0])! % num)
                default:
                    print("invalid operation")
            }
        }
        else{
            print("invalid response")
            break
        }
    }
    
    //if the second input was a number (not an operation or factorial) we keep asking for numbers until we get "sum" or "avg"
    else{
        var timeToCalc = false //used to end the loop
        while(!timeToCalc){
            response = readLine(stripNewline: true)!
            if(response == "sum" || response == "avg") {
                var sum = 0;
                for number in calcStack{
                    sum += Int(number)!
                }
                if(response == "sum"){
                    print(sum)
                }
                else{
                    print(sum / calcStack.count)
                }
                timeToCalc = true;
            }
            else{
                if let num = Int(response) {
                    calcStack.append(response);
                }
                else{
                    print("invalid response: Please enter a number before an operation")
                    break
                }
            }
        }
    }
}