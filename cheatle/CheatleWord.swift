//
//  CheatleWord.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI

struct CheatleWord: View {
    @Binding var word: [String]
    
    var body: some View {
        HStack {
            CheatleBox(letter: $word[0])
            CheatleBox(letter: $word[1])
            CheatleBox(letter: $word[2])
            CheatleBox(letter: $word[3])
            CheatleBox(letter: $word[4])
        }
    }
}
