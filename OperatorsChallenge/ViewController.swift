//
//  ViewController.swift
//  OperatorsChallenge
//
//  Created by Bob Ross
//  Copyright © 2020 MobileMakersEdu. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITextFieldDelegate, SFSafariViewControllerDelegate
{
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var equalToLabel: UILabel!
    @IBOutlet weak var notEqualToLabel: UILabel!
    @IBOutlet weak var greaterThanLabel: UILabel!
    @IBOutlet weak var lessThanLabel: UILabel!
    @IBOutlet weak var greaterThanOrEqualToLabel: UILabel!
    @IBOutlet weak var lessThanOrEqualToLabel: UILabel!
    
    @IBOutlet weak var numberOfTicketsTextField: UITextField!
    @IBOutlet weak var purchasedPackagesLabel: UILabel!
    @IBOutlet weak var individualTicketsLabel: UILabel!
    
    @IBOutlet weak var urlAddOnTextField: UITextField!
    
    var tickets = 0
    
    var arrayOfNumbers: [Int] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    
    @objc func keyboardWillShow(_ notification: Notification)
    {
        if numberOfTicketsTextField.isEditing || urlAddOnTextField.isEditing
        {
            self.view.frame.origin.y -= 200
        }
    }
    
    
    @objc func keyboardWillHide(_ notification: Notification)
    {
        if self.view.frame.origin.y != 0
        {
            self.view.frame.origin.y += 200
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func createAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter a number into each textfield before pressing Check MVP button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func mvpButtonPressed(_ sender: UIButton)
    {
        for textField in textFields {
            textField.resignFirstResponder()
            
            if let text = textField.text, !text.isEmpty, let number = Int(text) {
                arrayOfNumbers.append(number)
            } else {
                createAlert()
                return
            }
        }
    
        let number1 = arrayOfNumbers[0]
        let number2 = arrayOfNumbers[1]
        let number3 = arrayOfNumbers[2]
        let number4 = arrayOfNumbers[3]
        let number5 = arrayOfNumbers[4]
        let number6 = arrayOfNumbers[5]
        let number7 = arrayOfNumbers[6]
        let number8 = arrayOfNumbers[7]
        let number9 = arrayOfNumbers[8]
        let number10 = arrayOfNumbers[9]
        let number11 = arrayOfNumbers[10]
        let number12 = arrayOfNumbers[11]
        
        // MARK: - MVP
        let equalTo = number1 == number2
        equalToLabel.text = "evaluates to \(equalTo)"
        let notEqualTo = number3 != number4
        notEqualToLabel.text = "evaluates to \(notEqualTo)"
        let greaterThan = number5 > number6
        greaterThanLabel.text = "evaluates to \(greaterThan)"
        let lessThan = number7 < number8
        lessThanLabel.text = "evaluates to \(lessThan)"
        let greaterThanOrEqualTo = number9 >= number10
        greaterThanOrEqualToLabel.text = "evaluates to \(greaterThanOrEqualTo)"
        let lessThanOrEqualTo = number11 <= number12
        lessThanOrEqualToLabel.text = "evaluates to \(lessThanOrEqualTo)"
    }
    
    @IBAction func stretchOne(_ sender: UIButton)
    {
        numberOfTicketsTextField.resignFirstResponder()
        guard let data = numberOfTicketsTextField.text, !data.isEmpty, let numberOfTickets = Int(data) else { return }
        tickets = numberOfTickets

        
        // MARK: - Stretch #1
        let purchasedPackages = tickets/4
        purchasedPackagesLabel.text = "Buy \(purchasedPackages) packages"
        let individualTickets = tickets%4
        individualTicketsLabel.text = "Buy \(individualTickets) single tickets"
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    @IBAction func whenPinched(_ sender: UIPinchGestureRecognizer) {
        
        guard let data = numberOfTicketsTextField.text, !data.isEmpty, let numberOfTickets = Int(data) else { return }
        tickets = numberOfTickets
        
        if sender.velocity > 0 {
            
            tickets += 1
            
            
        } else {
            
            tickets -= 1
            
        }
        
        numberOfTicketsTextField.text = "\(tickets)"
    }

    @IBAction func stretchThree(_ sender: UIButton)
    {
        urlAddOnTextField.resignFirstResponder()
        guard let urlAddOn = urlAddOnTextField.text else { return }
        
        // MARK: - Stretch #3
        var uncharted = "https://www.unchartedlearning.org/"
        let fullURLPath = uncharted
        let myUrl = URL(string: fullURLPath)
        let svc = SFSafariViewController(url: myUrl!)
        svc.delegate = self
        self.present(svc, animated: true,
        completion: nil)

    }
}
