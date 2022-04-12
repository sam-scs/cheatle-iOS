//
//  ContentView.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var wordsFromFile = Words()
//TODO: hoist state of color
//TODO: add a loading icon while it loads the word list
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
                CheatleWord(word: $words[0])
                CheatleWord(word: $words[1])
                CheatleWord(word: $words[2])
                CheatleWord(word: $words[3])
                CheatleWord(word: $words[4])
                CheatleWord(word: $words[5])
            }
            
            Spacer()
            
            WordsList(words: wordsFromFile)
        }
        
        
    }
}

