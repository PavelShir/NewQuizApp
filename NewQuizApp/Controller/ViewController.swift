//
//  ViewController.swift
//  NewQuizApp
//
//  Created by Павел Широкий on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {

    let quizBrain = QuizBrain()
    
    @IBOutlet var buttonTrue: UIButton!
    @IBOutlet var buttonFalse: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        updateQuestion()
        buttonTrueSetup()
        buttonFalseSetup()
        progressBarSetup()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        
        if quizBrain.checkAnswer(answer) {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
        
        if questionNumber < (questions.count-1) {
            questionNumber += 1
        } else {
            print("The game is end.")
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc private func updateQuestion() {
        questionLabel.text = quizBrain.getQuestionText(0)
        buttonTrue.backgroundColor = .clear
        buttonFalse.backgroundColor = .clear
        progressBar.progress = quizBrain.getProgress(0)
    }
    
    private func setupLabel() {
        questionLabel.textColor = .systemYellow
        questionLabel.font = .systemFont(ofSize: 25)
        questionLabel.numberOfLines = .max
    }
    
    private func buttonTrueSetup() {
        buttonTrue.layer.borderWidth = 3
        buttonTrue.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonTrue.layer.cornerRadius = 10
        buttonTrue.setTitle("True", for: .normal)
    }
    
    private func buttonFalseSetup() {
        buttonFalse.layer.borderWidth = 3
        buttonFalse.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        buttonFalse.layer.cornerRadius = 10
        buttonFalse.setTitle("False", for: .normal)
    }
    
    private func progressBarSetup() {
        progressBar.progressViewStyle = .bar
        progressBar.progressTintColor = .systemPink
    }
}

