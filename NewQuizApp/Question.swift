//
//  Question.swift
//  NewQuizApp
//
//  Created by Павел Широкий on 23.02.2024.
//

import Foundation

struct Question {
    
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
