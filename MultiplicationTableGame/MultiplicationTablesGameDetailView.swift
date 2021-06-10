//
//  MultiplicationTablesGameDetailView.swift
//  MultiplicationTableGame
//
//  Created by Emile Wong on 31/5/2021.
//

import SwiftUI

struct MultiplicationTablesGameDetailView: View {
    // MARK: - PROPERTIES
    @Binding var isPlaying: Bool
    @Binding var questions: [question]
    
    @State var currentQuestion: Int = 0
    @State var score: Int = 0
    @State var isFinished: Bool = false
    @State private var answer: String = ""
    
    func saveAnswer(_ answer: Int ) {
        questions[currentQuestion].saveInputAnswer(answer)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.orange
            VStack{
                Text("Question \(currentQuestion + 1): ")
                HStack{
                    Text("\(questions[currentQuestion].firstNumber)  *  \(questions[currentQuestion].secondNumber)")
                        .font(.title)
                        .fontWeight(.black)
                    Text(questions[currentQuestion].answer > 0 ? " = \(questions[currentQuestion].answer)" : " = ??")
                        .font(.title)
                        .fontWeight(.black)
                    
                } //: HSTACK
                .padding(15)

                HStack{
                    Text(currentQuestion >= questions.count - 1 ? "You answer all questions" : "Your answer was \(answer)")
                    TextField("Answer", text: $answer)
                        .padding(15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .keyboardType(.numberPad)
                }
                .padding(15)

                HStack{
                    Spacer()
                    Button(action: {
                        if Int(answer) ?? 0 > 0 {
                            questions[currentQuestion].saveInputAnswer(Int(answer)!)
                        }
                        
                        if currentQuestion > 0 {
                            currentQuestion -= 1
                        }
                        answer = ""
                        
                    }, label: {
                        Text(currentQuestion > 0 ? "<< Previous" : "No more")
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    }) //: BUTTON
                    .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    
                    Spacer()
                    Button(action: {
                        if Int(answer) ?? 0 > 0 {
                            questions[currentQuestion].saveInputAnswer(Int(answer)!)
                        }
                        if currentQuestion < questions.count - 1 {
                            currentQuestion += 1
                        }
                        answer = ""
                        
                    }, label: {
                        Text(currentQuestion < questions.count  ? " Next >>" : "No More")
                            .font(.title3)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    }) //: BUTTON
                    .frame(width: 180, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    Spacer()
                }
                .padding(15)
                
                Button(action: {
                    score = 0
                    for i in (0..<questions.count) {
                        if questions[i].checkAnswer() {
                            score += 1
                        }
                    }
                    isFinished = true
                }, label: {
                    Text(isFinished ? "Game Over" : "Check Answer")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                })
                .padding(15)
                .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.yellow)
                .cornerRadius(30)
                
                Text(isFinished == true ? "Your score is \(score)" : "")
                    .font(.title)
                    .fontWeight(.black)
                
                Button(action: {
                    isPlaying.toggle()
                }, label: {
                    Text(isFinished ? "Tap me to Restart" : "")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.pink)
                        .padding(20)
                }) //: BUTTON
            } //: VSTACK
            .padding(.top, 30)
        } //: ZSTACK
        
    }
}


