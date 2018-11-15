//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Nathan Han on 11/5/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblCorrectIncorrect: UILabel!
    @IBOutlet weak var lblAnswer1: UILabel!
    @IBOutlet weak var lblAnswer2: UILabel!
    @IBOutlet weak var lblAnswer3: UILabel!
    @IBOutlet weak var lblAnswer4: UILabel!
    
    var appData = AppData.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        
        let labelList: [UILabel] = [self.lblAnswer1,self.lblAnswer2, self.lblAnswer3, self.lblAnswer4]
        
        showAnswers()
        checkAnswer(labelList)
        
        // Do any additional setup after loading the view.
    }
    
    func showQuestion() {
        lblQuestion.text = appData.currentQuestion
        NSLog("\(lblQuestion.text!)")
    }
    
    func showAnswers() {
        lblAnswer1.text = appData.allData[appData.subjectIdx].questions![appData.questionIndex].answers![0]
        lblAnswer2.text = appData.allData[appData.subjectIdx].questions![appData.questionIndex].answers![1]
        lblAnswer3.text = appData.allData[appData.subjectIdx].questions![appData.questionIndex].answers![2]
        lblAnswer4.text = appData.allData[appData.subjectIdx].questions![appData.questionIndex].answers![3]
    }
    
    func checkAnswer(_ labelList: [UILabel]) {
        NSLog("\(appData.answer)")
        NSLog("current: \(appData.allData[appData.subjectIdx].questions![appData.questionIndex].answer!)")
        if String(appData.answer + 1) == appData.allData[appData.subjectIdx].questions![appData.questionIndex].answer! {
            lblCorrectIncorrect.text = "Correct"
            lblCorrectIncorrect.font = UIFont.boldSystemFont(ofSize: 25)
            lblCorrectIncorrect.textColor = UIColor.green
            labelList[appData.answer].textColor = UIColor.green
            appData.correct += 1
        } else {
            lblCorrectIncorrect.text = "Incorrect"
            lblCorrectIncorrect.font = UIFont.boldSystemFont(ofSize: 25)
            lblCorrectIncorrect.textColor = UIColor.red
            labelList[appData.answer].textColor = UIColor.red
            let index = Int(appData.allData[appData.subjectIdx].questions![appData.questionIndex].answer!)
            labelList[index! - 1].textColor = UIColor.green
            }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        NSLog("\(appData.questionIndex)")
        appData.questionIndex += 1
        NSLog("\(appData.questionIndex)")
        appData.answer = -1
        if appData.questionIndex == (appData.allData[appData.subjectIdx].questions?.count)! {
            performSegue(withIdentifier: "toFinished", sender: self)
        } else {
            performSegue(withIdentifier: "backToQuestion", sender: self)
        }
    }
    
}
