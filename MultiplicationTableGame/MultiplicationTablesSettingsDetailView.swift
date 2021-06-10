//
//  MultiplicationTableSettingsDetailView.swift
//  HWSProjects
//
//  Created by Emile Wong on 27/5/2021.
//

import SwiftUI

struct MultiplicationTablesSettingsDetailView: View {
    // MARK: - PROPERTIES
    @Binding  var animationAmount: Double
    @Binding  var chosenImages: [String]
    @Binding var chosenNumbers: [Int]
    @Binding  var animalFarm : [String]
    @Binding var title: String
    @Binding var questions: [question]
    @Binding var isPlaying: Bool
    
    
    var buttonSize: CGFloat = 80
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    func addQuestions(_ number: Int)  {
        for i in 1...12 {
            questions.append(question(firstNumber: i, secondNumber: number))
        }
    }
    
    func removeQuestions(_ number: Int) {
        questions = questions.filter{$0.secondNumber != number}
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Color.orange
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<12, id: \.self) { index in
                        Button(action: {
                            if !chosenImages.contains(animalFarm[index]) {
                                chosenImages.append(animalFarm[index])
                                chosenNumbers.insert(index + 1, at: 0)
                                addQuestions(index + 1)
                                withAnimation {
                                    animationAmount += 180
                                }
                            } else {
                                withAnimation {
                                    animationAmount -= 180
                                }
                                chosenImages = chosenImages.filter{$0 != animalFarm[index]}
                                chosenNumbers = chosenNumbers.filter{$0 != index + 1 }
                                removeQuestions(index + 1)
                                
                            }
                            
                            withAnimation {
                                animationAmount += 180
                            }
                            
                        }, label: {
                            ZStack{
                                Image("\(animalFarm[index])")
                                    .resizable()
                                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(chosenImages.contains(animalFarm[index]) ? 1.0 : 0.0)
                                    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: chosenImages.last == animalFarm[index] ?  1 : 0, z: 0))
                                
                                
                                Text("\((animalFarm.firstIndex{$0 == animalFarm[index]} ?? 0) + 1)")
                                    .foregroundColor(.white)
                                    .font(.system(size: buttonSize / 2))
                                    .fontWeight(.black)
                                    .padding(6)
                                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: 10, x: 2.0, y: 2.0)
                                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                        })
                    } //:LOOP
                } //: LAZYVGRID
                .padding(.horizontal)
                
                VStack{
                    
                    ForEach(chosenNumbers, id: \.self) { number in
                        Text("\(number)")
                    }
                    Text("Total \(chosenNumbers.count * 12) questions")
                    Spacer()
                    Button(action: {
                        if chosenNumbers.count > 0 {
                            isPlaying.toggle()
                            questions.shuffle()
                        }
                    }, label: {
                        Text(chosenNumbers.count == 0 ? "Add multiplication tables" : "Tap here to Play")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        
                    })
                    .frame(width: 350, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    Spacer()
                }
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            title = "GAME SETTINGS"
            animationAmount = 0.0
            chosenImages = []
            chosenNumbers = []
            questions = []
        })
    } //: BODY
} //:STRUCT
