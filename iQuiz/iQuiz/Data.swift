//
//  Data.swift
//  iQuiz
//
//  Created by Nathan Han on 11/5/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class AppData: NSObject {
    static let shared = AppData()
    
//    open var subjects: [String] = ["Seattle", "Chicago", "NYC"]
//    open var descriptions: [String] = ["PNW", "Midwest", "Empire State of Mind"]
    open var subjectIdx = 0
    open var answer = -1
    open var currentQuestion = ""
    open var subjectAnswers: [String] = []
    open var questionIndex = 0
    open var correct = 0;

    open var carsQuestions: [String] = ["Which car is Naturally Aspirated?", "Which car comes with the most Horse Power from the factory?"]
    
    open var footballQuestions: [String] = ["Which team has won the most Super Bowls?", "Which team has the best record this season (2018), in the NFC West?"]
    
    open var vgQuestions: [String] = ["Which game has made the most money in 2018 so far?", "Which game franchise is the oldest?"]

    open var carsAnswers: [String] = ["Nissan 370z", "Subaru WRX", "Volkswagen Golf R", "Ford Focus ST", "Nissan 370z", "Subaru BRZ", "Genesis Coupe 3.8", "Nissan 370z", "Mitsubishi Miata", "Genesis Coupe 3.8"]
    
    open var footballAnswers: [String] = ["Seahawks", "Patriots", "Packers", "Steelers", "Steelers", "Rams", "Seahawks", "Cardinals", "49ers", "Rams"]
    
    open var vgAnswers: [String] = ["Red Dead Redemption 2", "Far Cry 5", "God of War", "Call of Duty: Black Ops 4", "Far Cry 5", "Call of Duty", "Pokemon", "Mario", "Street Fighter", "Mario"]
}
