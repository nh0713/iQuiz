//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Nathan Han on 11/4/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!

    var appData = AppData.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view.
    }
    
    func showQuestion() {
        switch appData.subjectIdx {
        case 0:
            appData.subjectAnswers = appData.carsAnswers
            appData.currentQuestion = appData.carsQuestions[appData.questionIndex]
            lblQuestion.text = appData.carsQuestions[appData.questionIndex]
            btnAnswer1.setTitle(appData.carsAnswers[appData.questionIndex + (appData.questionIndex * 4)], for: .normal)
            btnAnswer2.setTitle(appData.carsAnswers[appData.questionIndex + 1 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer3.setTitle(appData.carsAnswers[appData.questionIndex + 2 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer4.setTitle(appData.carsAnswers[appData.questionIndex + 3 + (appData.questionIndex * 4)], for: .normal)
        case 1:
            appData.subjectAnswers = appData.footballAnswers
            appData.currentQuestion = appData.footballQuestions[appData.questionIndex]
            lblQuestion.text = appData.footballQuestions[appData.questionIndex]
            btnAnswer1.setTitle(appData.footballAnswers[appData.questionIndex + (appData.questionIndex * 4)], for: .normal)
            btnAnswer2.setTitle(appData.footballAnswers[appData.questionIndex + 1 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer3.setTitle(appData.footballAnswers[appData.questionIndex + 2 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer4.setTitle(appData.footballAnswers[appData.questionIndex + 3 + (appData.questionIndex * 4)], for: .normal)
        case 2:
            appData.subjectAnswers = appData.vgAnswers
            appData.currentQuestion = appData.vgQuestions[appData.questionIndex]
            lblQuestion.text = appData.vgQuestions[appData.questionIndex]
            btnAnswer1.setTitle(appData.vgAnswers[appData.questionIndex + (appData.questionIndex * 4)], for: .normal)
            btnAnswer2.setTitle(appData.vgAnswers[appData.questionIndex + 1 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer3.setTitle(appData.vgAnswers[appData.questionIndex + 2 + (appData.questionIndex * 4)], for: .normal)
            btnAnswer4.setTitle(appData.vgAnswers[appData.questionIndex + 3 + (appData.questionIndex * 4)], for: .normal)
        default:
            lblQuestion.text = "Error"
        }
    }
    
    @IBAction func btnAnswer1(_ sender: Any) {
        appData.answer = 0
//        NSLog("\(appData.subjectAnswers[appData.answer])")
    }
    
    @IBAction func btnAnswer2(_ sender: Any) {
        appData.answer = 1
//        NSLog("\(appData.subjectAnswers[appData.answer])")
    }
    
    @IBAction func btnAnswer3(_ sender: Any) {
        appData.answer = 2
//        NSLog("\(appData.subjectAnswers[appData.answer])")
    }
    
    @IBAction func btnAnswer4(_ sender: Any) {
        appData.answer = 3
//        NSLog("\(appData.subjectAnswers[appData.answer])")
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        if appData.answer != -1 {
            performSegue(withIdentifier: "toAnswer", sender: self)
        }
    }
}
