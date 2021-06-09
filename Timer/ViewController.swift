//
//  ViewController.swift
//  Timer
//
//  Created by Apple on 09/06/2021.
//

import UIKit

enum Time {
    case Start, Pause
}

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer!
    var numberSecond: Int = 0
    
    var timeType: Time = .Start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
    }
    
    
    @objc func runLoop(){
        numberSecond += 1
        timeLabel.text = stringFromNumberSecond(numberSecond)
    }
    
    func stringFromNumberSecond(_ numberSecond: Int) -> String {
        let hour = numberSecond/3600
        let min = (numberSecond%3600)/60
        let sec = (numberSecond%3600)%60
        
        return "\(hour < 10 ? "0\(hour)" : "\(hour)"):\(min < 10 ? "0\(min)" : "\(min)"):\(sec < 10 ? "0\(sec)" : "\(sec)")"
    }
    
    
    @IBAction func changePress(_ sender: Any) {
        if timeType == Time.Start {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
            actionButton.setTitle("Pause", for: .normal)
            timeType = Time.Pause
        } else {
            actionButton.setTitle("Start", for: .normal)
            timeType = Time.Start
            timer.invalidate()
        }
    }
    
    @IBAction func resetPress(_ sender: Any) {
        numberSecond = 0
        timeLabel.text = stringFromNumberSecond(numberSecond)
        timeType = .Start
        timer.invalidate()
        actionButton.setTitle("Start", for: .normal)
    }
    
}

