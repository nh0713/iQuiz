//
//  ViewController.swift
//  iQuiz
//
//  Created by Nathan Han on 10/28/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

struct quizDescription: Decodable {
    let title: String?
    let desc: String?
    let questions: [quizData]?
}

struct quizData: Decodable  {
    let text: String?
    let answer: String?
    let answers: [String]?
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    var appdata = AppData.shared
    
    var subjects: [String] = []
    var descriptions: [String] = []
    let icons: [String] = ["flasks.svg", "marvel.png", "calculator.png"]
    
    var urlTextField: UITextField?
    var urlString = "https://tednewardsandbox.site44.com/questions.json";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJSON()
    }
    
    public func fetchJSON() {
        
        subjects = []
        descriptions = []
        
        guard let url =  URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in DispatchQueue.main.async {

            if data == nil {
                print("no internet")
                let alertVC = UIAlertController(title: "No Internet Connection", message: "Using Locally Stored Data", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in            alertVC.dismiss(animated: true)        })
                self.present(alertVC, animated: true)
            } else {
                print("internet")
                guard let data = data else { return }
                
                do {
                    let quizzes =  try JSONDecoder().decode([quizDescription].self, from: data)
                    for quiz in quizzes {
                        self.subjects.append(quiz.title!)
                        self.descriptions.append(quiz.desc!)
                        self.appdata.allData.append(quiz)
                    }
                    self.tblView.reloadData()
                } catch {
                    let alertVC = UIAlertController(title: "Download Failure", message: "Did not download JSON", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in            alertVC.dismiss(animated: true)        })
                    self.present(alertVC, animated: true)
                }
            }
            }
        }.resume()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "Subject") as! SubjectCell
        cell.lblTitle.text = subjects[indexPath.row]
        cell.lblDescription.text = descriptions[indexPath.row]
        cell.imgIcon.image = UIImage(named: icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.subjectIdx = indexPath.row
        performSegue(withIdentifier: "ToQuestion", sender: self)
    }
    
    @IBAction func btnSettings(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Input a JSON URL to try different quizzes", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: urlTextField)
        alert.addAction(UIAlertAction(title: "Check Now",
                                      style: .default,
                                      handler: self.fetchHandler))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: { _ in
                                        NSLog("\"Cancel\" pressed.")
        }))
        self.present(alert, animated: true, completion: {})
    }

    func urlTextField(textField: UITextField!) {
        urlTextField = textField
        urlTextField?.placeholder = "Input URL"
    }

    func fetchHandler(alert: UIAlertAction) {
        urlString = (urlTextField?.text)!.isEmpty ?
            "https://tednewardsandbox.site44.com/questions.json" : (urlTextField?.text)!
        fetchJSON()
    }
    
}

