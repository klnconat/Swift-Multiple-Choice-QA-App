//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
 
    
    @IBAction func answerButtonpressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let didUsergetItRight = quizBrain.checkAnswer(userAnswer)
        
        if didUsergetItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (Timer) in
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstOptionButton.setTitle(quizBrain.getOptionButtonCurrentTitleList()[0], for: .normal)
        secondOptionButton.setTitle(quizBrain.getOptionButtonCurrentTitleList()[1], for: .normal)
        thirdOptionButton.setTitle(quizBrain.getOptionButtonCurrentTitleList()[2], for: .normal)
        firstOptionButton.backgroundColor = UIColor.clear
        secondOptionButton.backgroundColor = UIColor.clear
        thirdOptionButton.backgroundColor = UIColor.clear
    }
    
}

