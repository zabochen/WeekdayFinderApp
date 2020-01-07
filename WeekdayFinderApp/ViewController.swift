//
//  ViewController.swift
//  WeekdayFinderApp
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        dateTextField.tintColor = .blue
        monthTextField.tintColor = .blue
        yearTextField.tintColor = .blue
    }
    
    
    // MARK: Find Day Button
    @IBAction func findDay() {
        
        let currentCalendar = Calendar.current
        
        var dateComponents = DateComponents()
        
        guard
            let day = dateTextField.text,
            let month = monthTextField.text,
            let year = yearTextField.text
            else { return }
        
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard
            let date = currentCalendar.date(from: dateComponents)
            else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        // List of locale
        // https://gist.github.com/jacobbubu/1836273
        dateFormatter.locale = Locale(identifier: "uk_UA")
        
        let weekDay = dateFormatter.string(from: date)
        self.resultLabel.text = weekDay.capitalized
        
    }
    
    // MARK: Hide Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
