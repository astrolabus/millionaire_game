//
//  GameScreenController.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 03.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

protocol GameScreenDelegate: AnyObject {
    func didEndGame(with result: Int, qustionsCount: Int)
}

class GameScreenController: UIViewController {
    
    var currentQuestion = 0
    var points = 0
    var rightAnswerPlacement = 0
    
    weak var gameScreenDelegate: GameScreenDelegate?
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var pointsCountLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionBGView: UIView! 
    
    let questions = [
        Question(question: "На каком инструменте играл древнерусский певец и сказитель Боян?", rightAnswer: "На гуслях", wrongAnswers: ["На виолончели", "На баяне", "На гитаре"]),
        Question(question: "В какой из этих стран один из официальных языков - французский?", rightAnswer: "Республика Гаити", wrongAnswers: ["Кения", "Эквадор", "Венесуэлла"]),
        Question(question: "В каком из этих фильмов не снимался Александр Абдулов?", rightAnswer: "Московские каникулы", wrongAnswers: ["Убить дракона", "Чародеи", "Карнавал"]),
        Question(question: "В каком году произошла Куликовская битва?", rightAnswer: "1380", wrongAnswers: ["1569", "1616", "1773"]),
        Question(question: "Какая картина Малевича находится в Русском музее?", rightAnswer: "Красный квадрат", wrongAnswers: ["Точильщик", "Черный квадрат", "Белый квадрат"])
    ]
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (sender.tag == Int(rightAnswerPlacement)) {
            points += 1
            if points == questions.count {
                endGame(with: points)
            } else {
                setupQuestion()
                pointsCountLabel.text = "Баллы: \(points)"
            }
        } else {
            endGame(with: points)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
    }
    
    func endGame(with points: Int) {
        gameScreenDelegate?.didEndGame(with: points, qustionsCount: questions.count)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupQuestion() {
        
        questionCountLabel.text = "Вопрос \(currentQuestion + 1)"
        questionLabel.text = questions[currentQuestion].question
        
        rightAnswerPlacement = Int.random(in: 1...4)
        
        var button = UIButton()
        var wrongAnswerPlacement = 0
        
        for i in 1...4 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswerPlacement) {
                button.setTitle(questions[currentQuestion].rightAnswer, for: .normal)
            } else {
                button.setTitle(questions[currentQuestion].wrongAnswers[wrongAnswerPlacement], for: .normal)
                wrongAnswerPlacement += 1
            }
        }
        
        currentQuestion += 1
    }

}
