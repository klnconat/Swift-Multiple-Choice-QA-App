//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Onat KILINÇ on 10.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    init (q: String, a: [String], c: String){
        text = q
        answer = a
        correctAnswer = c
    }
}
