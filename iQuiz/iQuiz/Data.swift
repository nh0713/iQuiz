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
    open var allData: [quizDescription] = []
}
