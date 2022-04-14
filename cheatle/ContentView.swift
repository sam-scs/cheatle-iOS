//
//  ContentView.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var wordsFromFile = Words()
//TODO: add a loading icon while it loads the word list
    
    @State private var colors: [[BoxColors]] =
    [
        [.white, .white, .white, .white, .white],
        [.white, .white, .white, .white, .white],
        [.white, .white, .white, .white, .white],
        [.white, .white, .white, .white, .white],
        [.white, .white, .white, .white, .white],
        [.white, .white, .white, .white, .white]
    ]
    @State private var words: [[String]] =
    [
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""]
    ]

    var body: some View {
        
        VStack {
            Group {
                CheatleWord(color: $colors[0], word: $words[0])
                CheatleWord(color: $colors[1], word: $words[1])
                CheatleWord(color: $colors[2], word: $words[2])
                CheatleWord(color: $colors[3], word: $words[3])
                CheatleWord(color: $colors[4], word: $words[4])
                CheatleWord(color: $colors[5], word: $words[5])
            }
            
            HStack {
                Button("Filter"){
                    self.filterWordList()
                }
                Button("Reset"){
                    self.colors = [
                        [.white, .white, .white, .white, .white],
                        [.white, .white, .white, .white, .white],
                        [.white, .white, .white, .white, .white],
                        [.white, .white, .white, .white, .white],
                        [.white, .white, .white, .white, .white],
                        [.white, .white, .white, .white, .white]
                    ]
                    self.words = [
                        ["","","","",""],
                        ["","","","",""],
                        ["","","","",""],
                        ["","","","",""],
                        ["","","","",""],
                        ["","","","",""]
                    ]
                    self.filterWordList()
                }
            }
            Spacer()
            
            WordsList(words: wordsFromFile)
        }
    }//end body some view
    
    func filterWordList(){
        wordsFromFile.filter(guesses: self.words, colors: self.colors)
    }
    
}//end ContentView

