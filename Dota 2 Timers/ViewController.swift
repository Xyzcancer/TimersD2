//
//  ViewController.swift
//  Dota 2 Timers
//
//  Created by Андрей Кропотов on 8/19/15.
//  Copyright (c) 2015 Druce_Studio. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var timerRosh: Timer!
    @IBOutlet weak var timerGlyph: Timer!
    
    var adTimer:NSTimer!
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
     // self.bannerView.adUnitID = "ca-app-pub-7637463123579934/3407924800"
        self.bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        self.bannerView.rootViewController = self
        
        let request = GADRequest()
        
        self.bannerView.loadRequest(request)
        
        
        
        
        self.view.layer.contents = UIImage(named:"fon.png")!.CGImage
        timerRosh.timerImage.image = UIImage(named: "roshan1osvg.png")!
        timerRosh.timerValue =  660
        timerRosh.timerType = Timer.TimerType.Roshan
        
        timerGlyph.timerImage.image = UIImage(named: "glif11.png")!
        timerGlyph.timerValue = 300
        timerGlyph.timerType = Timer.TimerType.Glyph
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendNotification(WithText text:String) {
        var localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.alertBody = text
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    func showRateMe() {
        var alert = UIAlertController(title: "Rate Us", message: "Thanks for using <APP NAME>", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Rate <APP NAME>", style: UIAlertActionStyle.Default, handler: { alertAction in
            UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=<iTUNES CONNECT APP ID>")!)
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No Thanks", style: UIAlertActionStyle.Default, handler: { alertAction in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "neverRate")
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: { alertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

