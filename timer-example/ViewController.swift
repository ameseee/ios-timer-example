//
//  ViewController.swift
//  timer-example
//
//  Created by Amy Holt on 5/13/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var timeLeft : Int = 0
    
    @IBOutlet weak var timeCountdown: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func processTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            timeCountdown.text? = String(timeLeft)
        } else {
            timer.invalidate()
            timeCountdown.text? = String(0)
        }
    }

    @IBAction func setTimerTapped(_ sender: UIButton) {
        timeLeft = Int(userInput.text!)!
        timeCountdown.text? = String(timeLeft)
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("processTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        timer.invalidate()
    }
}

