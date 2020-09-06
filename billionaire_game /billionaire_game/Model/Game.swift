//
//  Game.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 03.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    private let statisticsCaretaker = StatisticsCaretaker()
    private(set) var statistics = [Statistics]() {
        didSet {
            statisticsCaretaker.save(statistics: statistics)
        }
    }

    private init() {
        self.statistics = statisticsCaretaker.load()
    }
    
    func countResults(with score: Int, questionsCount: Int) {
        let result = (score * 100) / questionsCount
        
        let record = Statistics(date: Date(), points: result)
        statistics.append(record)
    }

    func clearStatistics() {
        statistics = []
    }
    
}
