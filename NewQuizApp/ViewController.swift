//
//  ViewController.swift
//  NewQuizApp
//
//  Created by Павел Широкий on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var buttonTrue: UIButton!
    @IBOutlet var buttonFalse: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    let questions = [
        ["A slug's blood is green.","True"],
        ["Approximately one quarter of human bones are in the feet.","True"],
        ["The total surface area of two human lungs is approximately 70 square metres.","True"],
        ["In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.","True"],
        ["In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.","False"],
        ["It is illegal to pee in the Ocean in Portugal.","True"],
        ["You can lead a cow down stairs but not up stairs.","False"],
        ["Google was originally called 'Backrub'.","True"],
        ["Buzz Aldrin's mother's maiden name was 'Moon'.","True"],
        ["The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.","False"],
        ["No piece of square dry paper can be folded in half more than 7 times.","False"],
        ["Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.","True"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        buttonTrueSetup()
        buttonFalseSetup()
        progressBarSetup()
        
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let answer = sender.currentTitle
        let correctAnswer = questions[questionNumber][1]
        
        if answer == correctAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber < (questions.count-1) {
            questionNumber += 1
        } else {
            print("The game is end.")
            questionNumber = 0
        }
        
        updateQuestion()
    }
    
    
    private func updateQuestion() {
        questionLabel.text = questions[questionNumber][0]
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

