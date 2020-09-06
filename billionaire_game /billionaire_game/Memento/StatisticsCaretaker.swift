//
//  StatisticsCaretaker.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 06.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import Foundation

class StatisticsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "statistics"
    
    func save(statistics: [Statistics]) {
        do {
            let data = try encoder.encode(statistics)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Statistics] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([Statistics].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
