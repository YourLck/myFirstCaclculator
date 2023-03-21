//
//  CalcService.swift
//  CalculatorApp
//
//  Created by Nikita Nemtsu on 03.03.2023.
//

import Foundation

class CalcService {
    
    // MARK: - Variables
    var isRunning = true
    var currentNumber = "0"
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentOperation = operation.noAction
    var result = ""
    
    var displayView: ViewController
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    //MARK: - Functions
    
//    func updateDisplay(text: String) {
//        print(text)
//    }
    
    func numberAction(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
          currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
    
    func makeCalculation(operation: operation) {
        if currentOperation != .noAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                    
                    //            case .noAction:
                    //
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .multiplicator:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                default:
                    break
                }
                
                firstNumber = Double(result)!
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
            }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
                
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: currentNumber)
            currentOperation = operation
        }
    }
    
    func addition() {
        makeCalculation(operation: .addition)
    }
    
    func substruction() {
        makeCalculation(operation: .substraction)
    }
    
    func multiplication() {
        makeCalculation(operation: .multiplicator)
    }
    
    func division() {
        makeCalculation(operation: .division)
    }
    
    func acAction() {
        currentNumber = ""
        firstNumber = 0.0
        secondNumber = 0.0
        currentOperation = operation.noAction
        result = ""
        displayView.updateDisplay(text: (currentNumber))
    }
    
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
    
    
    
}
