//
//  StatisticsScreenController.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 03.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class StatisticsScreenController: UIViewController {
    
    @IBOutlet weak var statisticsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statisticsTableView.delegate = self
        statisticsTableView.dataSource = self
    }
    
    func formateDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        
        return dateFormatter.string(from: date)
    }

}

extension StatisticsScreenController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.statistics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statisticsTableView.dequeueReusableCell(withIdentifier: "statisticsCell", for: indexPath) as! StatisticsScreenCell
        
        let date = Game.shared.statistics[indexPath.row].date
        let points = Game.shared.statistics[indexPath.row].points
        
        cell.dateLabel.text = "Дата игры: \(formateDate(date))"
        cell.pointsLabel.text = "Результат: \(points)%"
        
        return cell
    }
    
}

extension StatisticsScreenController: UITableViewDelegate {
}
