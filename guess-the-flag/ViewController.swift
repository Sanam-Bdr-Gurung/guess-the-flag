//
//  ViewController.swift
//  guess-the-flag
//
//  Created by Sanam Gurung on 8/13/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries=[String]()
    var score = 0
    var correctAnswer = 0
    var rounds = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }
    
   
    func askQuestion(action: UIAlertAction?){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
        // Create a UILabel
        let label = UILabel()
        label.text = "Score: \(score)"
        // Wrap the UILabel in a UIBarButtonItem
        let textItem = UIBarButtonItem(customView: label)
        self.navigationItem.rightBarButtonItem = textItem
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Keep Going"
        }else{
            title = "Wrong"
            score -= 1
            message = "That’s the flag of \(countries[sender.tag])"
        }
        rounds += 1
        if rounds >= 10 {
            message = "Your final score is \(score)"
            rounds = 0
            score = 0
        }
       _showMessage(title,message)
    }
    
    func _showMessage(_ title: String,_ message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
        present(ac,animated: true)
    }
    
}

