//
//  CheatleWord.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI

struct CheatleWord: View {
    @Binding var color: [BoxColors]
    @Binding var word: [String]
    
    
    
    var body: some View {
        HStack {
            CheatleBox(boxState: $color[0], letter: $word[0])
            CheatleBox(boxState: $color[1], letter: $word[1])
            CheatleBox(boxState: $color[2], letter: $word[2])
            CheatleBox(boxState: $color[3], letter: $word[3])
            CheatleBox(boxState: $color[4], letter: $word[4])
        }
    }
}
