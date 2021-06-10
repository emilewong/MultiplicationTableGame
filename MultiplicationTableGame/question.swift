//
//  question.swift
//  MultiplicationTableGame
//
//  Created by Emile Wong on 31/5/2021.
//

class question {
    var firstNumber: Int
    var secondNumber: Int
    var answer: Int
    init(firstNumber: Int, secondNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.answer = 0
    }
    
    func saveInputAnswer (_ answer: Int) {
        self.answer = answer
    }
    
    func checkAnswer() -> Bool {
        let firstXsecond = self.firstNumber * self.secondNumber
        
        if firstXsecond == self.answer {
            return true
        } else {
            return false
        }
    }
}
