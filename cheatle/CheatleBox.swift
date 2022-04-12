//
//  CheatleBox.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI
import Combine

struct CheatleBox: View {
    @State private var boxState = BoxColors.white
    @Binding var letter: String
    
    
    private var boxColor : Color {
        switch boxState {
        case .white:
            return Color.white
        case .gray:
            return Color.gray
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        }
    }
    
    var body: some View {
        Button{
            if (letter.count > 0){
                boxState.next()
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(boxColor)
                    .frame(width: 40, height: 40)
                    .border(Color.black)
                TextField("", text: $letter)
                    .textCase(.uppercase)
                    .frame(width:30, height: 30)
                    .border(Color.black)
                    .onReceive(Just(letter)){_ in limitText()}
            }
            
        }
    }
    
    func limitText(){
        if letter.count > 1 {
            letter = String(letter.prefix(1))
        }
    }
}

enum BoxColors: CaseIterable {
    case white, gray, yellow, green
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}

