//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Nathan Han on 11/5/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var lblCongratulatoryText: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    var appData = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScore.text = "\(appData.correct)/\((appData.allData[appData.subjectIdx].questions?.count)!)"
        congratulatoryText()
        clear()
    }
    
    func clear() {
        appData.subjectIdx = 0
        appData.answer = 0
        appData.currentQuestion = ""
        appData.subjectAnswers = []
        appData.questionIndex = 0
        appData.correct = 0
    }
    
    func congratulatoryText() {
        let total = (appData.allData[appData.subjectIdx].questions?.count)!
        if appData.correct == total - 1 {
            lblCongratulatoryText.text = "SO CLOSE"
            lblScore.textColor = UIColor.yellow
        } else if appData.correct == 0 {
            lblCongratulatoryText.text = "Not so good..."
            lblScore.textColor = UIColor.red
        } else if appData.correct == total {
            lblCongratulatoryText.text = "PERFECT!"
            lblScore.textColor = UIColor.green
        } else {
            lblCongratulatoryText.text = "Good try!"
        }
    }

}
