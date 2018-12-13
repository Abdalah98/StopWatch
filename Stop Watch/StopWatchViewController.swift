//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Abdalah on 28/11/18.
//  Copyright © 2018 Abdalah. All rights reserved.
//


import UIKit

class StopWatchViewController: UIViewController
{
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    var timer = Timer()
    var isTimaingRunnig = false
    var counter = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
                resetButton.isEnabled = false
                pauseButton.isEnabled = false
                startButton.isEnabled = true
        timerLabel.layer.cornerRadius = 10.0
        timerLabel.layer.masksToBounds = true
        
        resetButton.layer.cornerRadius = 5.0
        resetButton.layer.masksToBounds = true
resetButton.isEnabled = false
        resetButton.alpha = 0.5
        
       pauseButton.layer.cornerRadius = pauseButton.bounds.width / 2.0
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled  = false
        pauseButton.alpha = 0.5
        startButton.layer.cornerRadius = startButton.bounds.width / 2.0
        startButton.layer.masksToBounds = true


        
  
    }
    
    @IBAction func resetDidTap(_ sender: Any)
    {
         timer.invalidate()
        isTimaingRunnig = false
counter = 0.0
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
//                                               عشان الشافيه مثلا لما ادوس علي ستار بس منور وكل ظلمه//
       resetButton.alpha = 0.5
       startButton.alpha = 1.0
        pauseButton.alpha = 0.5
       


       
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
        
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.alpha = 1.0
        startButton.alpha = 1.0
        pauseButton.alpha = 0.5
        isTimaingRunnig = false
        timer.invalidate()


    }
    
    @IBAction func startDidTap(_ sender: Any)
    {
        if !isTimaingRunnig{
            //zy loob kada
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimaingRunnig = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
            resetButton.alpha = 1.0
            startButton.alpha = 5.0
            pauseButton.alpha = 1.0


            
        }

        }
    
        // MARK: - Helper methods
    @objc func runTimer() {
    counter += 0.1
        //floor == float
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let  mintue = (flooredCounter % 3600) / 60
//hana bn7ol 3shan y2ra 01 min kaza
        var mintueString = "\(mintue)"
        if mintue < 10{
            mintueString = "0\(mintue)"
        }
        let  second = (flooredCounter % 3600)  % 60
       var secontString = "\(second)"
        if second < 10
        {
            secontString = "0\(second)"
        }
        let desiSecond = String(format : "%.1f",counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(mintueString):\(secontString).\(desiSecond)"
    }
    
}

