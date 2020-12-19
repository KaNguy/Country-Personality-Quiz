//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by KaNguy on 12/10/20.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight) {
            resultImageView.isHidden = true
        } else if (UIDevice.current.orientation == UIDeviceOrientation.portrait || UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown) {
            resultImageView.isHidden = false
        }
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if (UIDevice.current.orientation.isLandscape) {
            resultImageView.isHidden = true
        } else {
            resultImageView.isHidden = false
        }
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [CountryType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.sorted { $0.1 > $1.1 }.first!.key
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        resultImageView.image = UIImage(imageLiteralResourceName: mostCommonAnswer.displayImage())
        resultImageView.layer.cornerRadius = 10.0
        resultImageView.clipsToBounds = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
