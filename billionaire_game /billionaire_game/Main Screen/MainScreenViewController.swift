//
//  MainScreenViewController.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 03.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var pointsCountLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var statisticsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGame":
            guard let destination = segue.destination as? GameScreenController else { return }
            destination.gameScreenDelegate = self
            destination.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }

}

extension MainScreenViewController: GameScreenDelegate {
    func didEndGame(with result: Int, qustionsCount: Int) {
        pointsCountLabel.text = "Ваши баллы: \(result)"
        
        Game.shared.countResults(with: result, questionsCount: qustionsCount)
        // Game.shared.clearStatistics()
    }
}
