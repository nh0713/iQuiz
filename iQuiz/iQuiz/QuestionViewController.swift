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
            appData.subjectAnswers = appData.allData[0].questions![appData.questionIndex].answers!
            appData.currentQuestion = appData.allData[0].questions![appData.questionIndex].text!
            lblQuestion.text = appData.allData[0].questions![appData.questionIndex].text!
            btnAnswer1.setTitle(appData.allData[0].questions![appData.questionIndex].answers![0], for: .normal)
            btnAnswer2.setTitle(appData.allData[0].questions![appData.questionIndex].answers![1], for: .normal)
            btnAnswer3.setTitle(appData.allData[0].questions![appData.questionIndex].answers![2], for: .normal)
            btnAnswer4.setTitle(appData.allData[0].questions![appData.questionIndex].answers![3], for: .normal)
        case 1:
            appData.subjectAnswers = appData.allData[1].questions![appData.questionIndex].answers!
            appData.currentQuestion = appData.allData[1].questions![appData.questionIndex].text!
            lblQuestion.text = appData.allData[1].questions![appData.questionIndex].text!
            btnAnswer1.setTitle(appData.allData[1].questions![appData.questionIndex].answers![0], for: .normal)
            btnAnswer2.setTitle(appData.allData[1].questions![appData.questionIndex].answers![1], for: .normal)
            btnAnswer3.setTitle(appData.allData[1].questions![appData.questionIndex].answers![2], for: .normal)
            btnAnswer4.setTitle(appData.allData[1].questions![appData.questionIndex].answers![3], for: .normal)
        case 2:
            appData.subjectAnswers = appData.allData[2].questions![appData.questionIndex].answers!
            appData.currentQuestion = appData.allData[2].questions![appData.questionIndex].text!
            lblQuestion.text = appData.allData[2].questions![appData.questionIndex].text!
            btnAnswer1.setTitle(appData.allData[2].questions![appData.questionIndex].answers![0], for: .normal)
            btnAnswer2.setTitle(appData.allData[2].questions![appData.questionIndex].answers![1], for: .normal)
            btnAnswer3.setTitle(appData.allData[2].questions![appData.questionIndex].answers![2], for: .normal)
            btnAnswer4.setTitle(appData.allData[2].questions![appData.questionIndex].answers![3], for: .normal)
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
