//
//  ViewController.swift
//  NewQuizApp
//
//  Created by Павел Широкий on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {

    var quizBrain = QuizBrain()
    
    @IBOutlet var scoreLabel: UILabel!
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
        setupScoreLabel()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle!
        
        if quizBrain.checkAnswer(answer) {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc private func updateQuestion() {
        questionLabel.text = quizBrain.getQuestionText()
        buttonTrue.backgroundColor = .clear
        buttonFalse.backgroundColor = .clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
    private func setupLabel() {
        questionLabel.textColor = .systemYellow
        questionLabel.font = .systemFont(ofSize: 25)
        questionLabel.numberOfLines = .max
    }
    
    private func setupScoreLabel() {
        scoreLabel.textColor = .white
        scoreLabel.font = .systemFont(ofSize: 20)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
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

