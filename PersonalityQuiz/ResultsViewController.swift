//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Farginda on 11/14/18.
//  Copyright © 2018 Farginda. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsAnswerLabel.preferredMaxLayoutWidth = 100
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    // calculate quiz result
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in return pair1.value > pair2.value })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
    
        resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    
    }
}
