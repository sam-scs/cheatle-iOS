//
//  WordsList.swift
//  cheatle
//
//  Created by Sam Johnson on 4/11/22.
//

import SwiftUI

struct WordsList: View {
    @ObservedObject var words: Words
    
    var body: some View {
        ScrollView {
            VStack {
                Text(words.data)
            }
            .padding()
        }
    }
}

class Words: ObservableObject {
    @Published var data: String = ""
    init(){
        self.load(file: "english5letterwords")
    }
    func load(file: String){
        if let filepath = Bundle.main.path(forResource: file, ofType: "txt"){
            do {
                let contents = try String(contentsOfFile: filepath)
                DispatchQueue.main.async {
                    self.data = contents
                }
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("File Not Found")
        }
    }
    func filter(filterWord: String){
//TODO: implement this and take in the array of letters and the array of colors
    }
}
