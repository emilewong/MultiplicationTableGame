//
//  MultiplcationTablesGameView.swift
//  HWSProjects
//
//  Created by Emile Wong on 27/5/2021.
//

import SwiftUI

struct MultiplicationTablesGameView: View {
    // MARK: - PROPERTIES
    @State  var isNavigationBarHidden : Bool = true
    @State var title: String = "Multiplication Tables"
    @State  var selectTab = Tabs.Settings
    @State  var animationAmount = 0.0
    @State  var chosenImages: [String] = []
    @State var chosenNumbers: [Int] = []
    @State var questions = [question]()
    @State var isPlaying = false
    @State  var animalFarm = ["dog", "chicken", "cow", "monkey", "pig", "snake", "goat", "horse", "crocodile", "panda", "parrot", "whale"].shuffled()

    enum Tabs {
        case GameDetail
        case Settings
    }
    
    // MARK: - BODY
    var body: some View {
            VStack{
                if isPlaying {
                    MultiplicationTablesGameDetailView(isPlaying: $isPlaying, questions: $questions)
                } else {
                    MultiplicationTablesSettingsDetailView(animationAmount: $animationAmount, chosenImages: $chosenImages, chosenNumbers: $chosenNumbers, animalFarm: $animalFarm, title: $title, questions: $questions, isPlaying: $isPlaying)
                }
                
            } //: VSTACK
    }
}


// MARK: - PREVIEW
struct MultiplcationTablesGameView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationTablesGameView()
    }
}
