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
                ForEach(words.filteredWords, id:\.self){ word in
                    Text("\(word)")
                }
                
            }
            .padding()
        }
    }
}

class Words: ObservableObject {
    @Published var filteredWords = [String]()
    
    private var allWords = [String]()
    
    init(){
        self.load(file: "english5letterwords")
    }
    func load(file: String){
        if let filepath = Bundle.main.url(forResource: file, withExtension: "txt"){
            if let contents = try? String(contentsOf: filepath){
                self.allWords = contents.components(separatedBy: "\n")
                self.filteredWords = self.allWords //initialize filtered list to be all of them
            }
            
        } else {
            print("File Not Found")
        }
    }
    func filter(guesses: [[String]], colors: [[BoxColors]] ){
        var newFilteredList = [String]()
        
        var yellowLetters = [String]()
        for i in 0 ..< guesses.count {
            //foreach guess
            for j in 0 ..< guesses[i].count {
                //foreach letter
                if colors[i][j] == BoxColors.yellow {
                    yellowLetters.append(guesses[i][j])
                }
            }
        }

        
        eachWordLoop: for word in allWords {
            if word.count != 5 {
                //if this is some trailing blank line then skip it
                continue eachWordLoop
            }
            
            //foreach word break it into a character array
            let characters = word.map(String.init)
            for i in 0 ..< guesses.count {
                //foreach guess
                for j in 0 ..< guesses[i].count {
                    //foreach letter
                    //if it's green
                    if
                        colors[i][j] == BoxColors.green &&
                        characters[j] != guesses[i][j]
                    {
                        //green letters are correct so if they don't match then this is not a good word
                        continue eachWordLoop
                    }//end if green
                    
                    if
                        colors[i][j] == BoxColors.gray &&
                        characters[j] == guesses[i][j]
                    {
                        //gray letters must not match or else this gets kicked out
                        continue eachWordLoop
                    }//end if gray
                    
                    if
                        colors[i][j] == BoxColors.yellow &&
                        characters[j] == guesses[i][j]
                    {
                        //yellow letters much not match since they are in the wrong spot
                        continue eachWordLoop
                    }//end if yellow
                    
                    
                    
                }//end for letters (j)
            }//end for words (i)
            
            //made it through each of our guesses so lastly check that we do have all the yellow letters in this word
            for letter in yellowLetters {
                if !word.contains(letter) {
                    continue eachWordLoop
                }
            }
            //we have all the yellow letters so let it ride
            newFilteredList.append(word)
            
        }//end eachWordLoop
        
        self.filteredWords = newFilteredList
    }
}
