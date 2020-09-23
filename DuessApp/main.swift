//
//  main.swift
//  DuessApp
//
//  Created by Umar Sunusi Maitalata on 10/09/2020.
//  Copyright © 2020 IWORLDOFTECH. All rights reserved.
//

import Foundation

var randomNumber = 1
var continueGuessing = true
var keepPlaying = true
var input = ""
var guessCount = 1
var playCount = 1;

while keepPlaying{
    // Get a random number between 0 - 100
    randomNumber = Int(arc4random_uniform(101))
    print("The random number to guess is \(randomNumber) ")
    
    while continueGuessing {
        print("Pick a number between 0 and 100.")
        // Get keyboard input, and trim the new line
        input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let userGuess = Int(input){
            if userGuess == randomNumber {
                continueGuessing = false
                print("Correct number!")
            }else if userGuess > randomNumber{
                // User guessed too high
                print("Your guess is too high")
                guessCount += 1
            }else{
                // No need to check if userGuess < randomNumber, it has to be
                print("Your guess is too low")
                guessCount += 1
            }
        }else{
            print("Invalid guess, please try again.")
            guessCount += 1
        }
    }
    
    print("Play again? Y or N")
    input = String(bytes: FileHandle.standardInput.availableData, encoding: .utf8)!
    input = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if input == "N" || input == "n" {
        keepPlaying = false
    }else{
        playCount += 1
    }
    
    continueGuessing = true
    
    
}

print("Number of guesses \(guessCount)")
print("Number of plays \(playCount)")

