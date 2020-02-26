//
//  ContentView.swift
//  Calculator
//
//  Created by student on 12/11/19.
//  Copyright © 2019 Supakin  Sakunwa. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var operation: String = ""
    @State var numA:String = ""
    @State var numB:String = ""
    @State var hiddenNumber:Bool = false
    @State var result:String = "0"
    
    var body: some View {
        VStack() {
            
            HStack{
                Spacer()
                Text("\(result)")
                    .font(.title)
                    .multilineTextAlignment(.trailing)
                    .frame(height: 150.0)
                 
            }
            .padding(.horizontal)
            
//            Text("A = \(numA)")
//            Text("B = \(numB)")
//            Text("operation = \(operation)")
            HStack(spacing: 0.0) {
                ButtonNumber(text: "AC", color:  .gray, widthBox: 100.0, heightBox: 100.0 , numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "%", color:  .gray, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "+/-", color:  .gray, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "/", color:  .orange, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
            }
           
            HStack(spacing: 0.0) {
                ButtonNumber(text: "7", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "8", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "9", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "*", color:  .orange, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
            }
            HStack(spacing: 0.0) {
                ButtonNumber(text: "4", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "5", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "6", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "-", color:  .orange, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
            }
            HStack(spacing: 0.0) {
                ButtonNumber(text: "1", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "2", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "3", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: "+", color:  .orange, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
            }
            HStack(spacing: 0.0) {
                ButtonNumber(text: "0", color:  .black, widthBox: 200.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
                ButtonNumber(text: ".", color:  .black, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
               
                
                
                ButtonNumber(text: "=", color:  .orange, widthBox: 100.0, heightBox: 100.0, numA: $numA, numB: $numB, operation: $operation, result: $result, hiddenNumber : $hiddenNumber)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonNumber: View {
    let text : String
    let color: Color
    let widthBox : CGFloat
    let heightBox : CGFloat
    @Binding var numA: String
    @Binding var numB: String
    @Binding var operation: String
    @Binding var result: String
    @Binding var hiddenNumber: Bool
    
    func initCalculator() {
        self.numA = ""
        self.numB = ""
        self.operation = ""
        self.result = "0"
        self.hiddenNumber = false
    }
    
    func handleTap() {
        if (text == "AC") {
            initCalculator()
        } else if (text == "%") {
//            self.setEqual()
            self.percentage()
        }else if (text == "+/-") {
            self.setEqual()
            self.switchNegPos()
        }  else if (text == ".") {
            if (self.result != "") {
                if (!self.hasDot()) {
                    if (self.numA != "") {
                        self.result += text
                        self.numB += text
                    } else {
                        self.result += text
                    }
                }
            }
        } else if (text == "=") {
            self.setEqual()
            self.operation = ""
        } else if text == "0" || text == "1" || text == "2" || text == "3" || text == "4" || text == "5" || text == "6" || text == "7" || text == "8" || text == "9"{
            self.setNumber()
        } else {
            self.setOperation()
        }
    }
    
    func setNumber() {
        if (hiddenNumber) {
            self.hiddenNumber = false
            self.result = text
            self.numB = text
        } else {
            if (self.result == "0") {
                self.result = text
            } else {
                if (self.numA != "") {
                    self.result += text
                    self.numB += text
                } else {
                    self.result += text
                }
                
            }
        }
        
    }
    
    func setOperation() {
        hiddenNumber = true
        if (self.operation != "") {
            self.setEqual()
            self.operation = text
        
        } else {
            self.operation = text
            self.numA = self.result
            
        }
    }
    
    func setEqual() {
        if (self.numA != "" && self.numB != "") {
            let numA1:Double = Double(self.numA) ?? 0
            let numB1:Double = Double(self.numB) ?? 0
            
            switch self.operation {
            case "+":
                
                self.result = NSNumber(value: numA1 + numB1).stringValue
                break
            case "-":
                self.result = NSNumber(value: numA1 - numB1).stringValue
                break
            case "*":
                self.result = NSNumber(value: numA1 * numB1).stringValue
                break
            case "/":
                self.result = NSNumber(value: numA1 / numB1).stringValue
                break
            default:
                break
                
            }
            self.numA = self.result
            self.numB = ""
        }
    }
    
    func hasDot() -> Bool {
        for char in self.result {
            if char == "." {
                return true
            }
        }
        return false
    }
    
    func switchNegPos() {
        let temp:Double = Double(self.result) ?? 0
        self.result = String(temp * -1)
    }
    
    func isNegativeNumber () ->Bool {
        for char in self.result {
            if char == "-" {
                return true
            }
        }
        
        return false
    }
    
    func percentage () {
        if (self.numA == "") {
            let temp:Double = Double(self.result) ?? 0
            self.result = String(temp / 100)
        } else {
            let temp:Double = Double(self.result) ?? 0
            let numA1:Double = Double(self.numA) ?? 0
            self.result = String(numA1 * temp / 100)
            self.numB = self.result
        }
        
    }
    
//    func displayResult (value: String) {
//        if (hasDecimalNotZero(value: value)) {
//            self.result = value
//        } else {
//            self.result = String(Int(value) ?? 0)
//        }
//    }
//
//    func hasDecimalNotZero (value: String) -> Bool {
//        var countDot = 0
//        for char in value {
//            if char == "." {
//                countDot = 1
//            }
//
//            if countDot != 0 {
//                if (char != "0") {
//                    return true
//                }
//            }
//        }
//
//        return false
//    }
    
    

    var body: some View {
        Button(action: {
            self.handleTap()
        }) {
            Text(text)
                .font(.title)
                .foregroundColor(Color .white)
        }
        .frame(width: widthBox, height: heightBox)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .onTapGesture {
            self.handleTap()
        }
    }
}
