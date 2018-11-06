//
//  ViewController.swift
//  iQuiz
//
//  Created by Nathan Han on 10/28/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    var appdata = AppData.shared
    
    let subjects: [String] = ["Cars", "Football", "Video Games"]
    let descriptions: [String] = ["A quiz for car enthusiasts", "Test your knowledge of football", "Git gud and test your gaming knowledge"]
    let icons: [String] = ["sedan-car-front.png", "footballplayer.png", "console.png"]
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnSettings(_ sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
         alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in            alertVC.dismiss(animated: true)        })
        self.present(alertVC, animated: true)
    }
    
}

