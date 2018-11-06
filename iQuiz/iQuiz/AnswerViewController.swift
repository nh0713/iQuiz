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
        
        var labelList: [UILabel] = [self.lblAnswer1,self.lblAnswer2, self.lblAnswer3, self.lblAnswer4]
        
        showAnswers()
        checkAnswer(labelList)
        
        // Do any additional setup after loading the view.
    }
    
    func showQuestion() {
        lblQuestion.text = appData.currentQuestion
        NSLog("\(lblQuestion.text!)")
    }
    
    func showAnswers() {
        lblAnswer1.text = appData.subjectAnswers[appData.questionIndex * 5 + 0]
        lblAnswer2.text = appData.subjectAnswers[appData.questionIndex * 5 + 1]
        lblAnswer3.text = appData.subjectAnswers[appData.questionIndex * 5 + 2]
        lblAnswer4.text = appData.subjectAnswers[appData.questionIndex * 5 + 3]
    }
    
    func checkAnswer(_ labelList: [UILabel]) {
        NSLog("\(appData.answer)")
        NSLog("\(appData.subjectAnswers[appData.questionIndex * 5 +  appData.answer]) \(appData.subjectAnswers[appData.questionIndex * 5 + 4])")
        if appData.subjectAnswers[appData.questionIndex * 5 +  appData.answer] == appData.subjectAnswers[appData.questionIndex * 5 + 4] {
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
            var index = 0
            NSLog("\(appData.subjectAnswers[appData.questionIndex * 5 + 4])")
            while labelList[index].text !=  appData.subjectAnswers[appData.questionIndex * 5 + 4]{
                index += 1
            }
            labelList[index].textColor = UIColor.green
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        NSLog("\(appData.questionIndex)")
        appData.questionIndex += 1
        NSLog("\(appData.questionIndex)")
        appData.answer = -1
        if appData.questionIndex == 2 {
            performSegue(withIdentifier: "toFinished", sender: self)
        } else {
            performSegue(withIdentifier: "backToQuestion", sender: self)
        }
    }
    
}
