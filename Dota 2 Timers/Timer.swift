//
//  Timer.swift
//  Dota 2 Timers
//
//  Created by Андрей Кропотов on 8/19/15.
//  Copyright (c) 2015 Druce_Studio. All rights reserved.
//

import UIKit

class Timer: UIView {
    var timerValue : Int32!
    var currentTimerValue : Int32!
    var timerImage: UIImageView!
    var timerValueLabel: UILabel!
    
    let progressIndicatorView = TimerProgressView(frame: CGRectZero)
    
    var timerStep:CGFloat {
        get {
            return CGFloat(currentTimerValue) * ( 1 / CGFloat(timerValue) )
        }
    }
    //var view:UIView!
    var timer = NSTimer()
    
    override init (frame:CGRect) {
        super.init(frame: frame)
        let view = NSBundle.mainBundle().loadNibNamed("Timer", owner: self, options: nil)[0] as! UIView
        self.addSubview(view)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        currentTimerValue = timerValue
        self.timerImage = UIImageView(frame: CGRectMake(0, 0, 265, 200))
        self.timerImage.image = UIImage()
        self.timerValueLabel = UILabel(frame: CGRectMake(110, 20, 150, 30))
        //self.timerValueLabel.text = getStringForTimer()
        self.timerValueLabel.textColor = UIColor.whiteColor()
        let tapG = UITapGestureRecognizer()
        tapG.addTarget(self, action: "startTimer")
        
        self.addGestureRecognizer(tapG)
        self.addSubview(self.timerImage)
        self.addSubview(self.timerValueLabel)
        
        timerImage.addSubview(self.progressIndicatorView)
        progressIndicatorView.backgroundColor = UIColor.clearColor()
        progressIndicatorView.alpha = 0.4
        let scaleTrans = CGAffineTransformMakeScale(-1, 1)
        let angle = CGAffineTransformMakeRotation((90.0 * CGFloat(M_PI)) / 180.0)
        
        progressIndicatorView.transform = CGAffineTransformConcat(scaleTrans,angle)
        progressIndicatorView.frame = bounds
        progressIndicatorView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
    }
    
    
    
    func startTimer() {
        
        if !timer.valid {
            
            progressIndicatorView.progress = 1
            currentTimerValue = timerValue
            timerValueLabel.text = getStringForTimer()
            let aSelector: Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        } else {
            
            stopTimer()
        }
    }
    
    func stopTimer() {

        timer.invalidate()
        currentTimerValue = timerValue
        timerValueLabel.text = getStringForTimer()
        progressIndicatorView.progress = 0
    }
    
    func getStringForTimer() -> String {
    
        var minutes = currentTimerValue / 60
        var seconds = currentTimerValue - 60 * minutes
        if seconds < 10 {
            return "\(minutes):0\(seconds)"
        }
        return "\(minutes):\(seconds)"
    }
    
    func updateTime() {
        
        if currentTimerValue == 0 {
            stopTimer()
            return
        }
        
        progressIndicatorView.progress =  timerStep

        currentTimerValue = currentTimerValue - 1
        timerValueLabel.text = getStringForTimer()

    }
    
    
}
