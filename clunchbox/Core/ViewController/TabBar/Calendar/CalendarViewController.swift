//
//  CalendarViewController.swift
//  clunchbox
//
//  Created by Macintosh on 15/12/2018.
//  Copyright © 2018 Eléa Reggiani. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: JTAppleCalendarView!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.collectionView.calendarDataSource = self
        self.collectionView.calendarDelegate = self
        // Do any additional setup after loading the view.
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuDayCell = self.tableView.dequeueReusableCell(withIdentifier: "menuDayCell", for: indexPath)
        menuDayCell.textLabel?.text = "\(indexPath.row)"
        
        return menuDayCell
    }
    
    
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
      
        return
    }
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
         let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    

    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        myCustomCell.cellDay.text = cellState.text
        return myCustomCell
    }

}


