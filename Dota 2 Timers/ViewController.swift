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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
       // self.bannerView.adUnitID = "ca-app-pub-7637463123579934/3407924800"
        self.bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        self.bannerView.rootViewController = self
        
        var request = GADRequest()
        
        self.bannerView.loadRequest(request)
        
        
        self.view.layer.contents = UIImage(named:"fon.png")!.CGImage
        
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "")!)
        
        timerRosh.timerImage.image = UIImage(named: "roshan1osvg.png")!
        timerGlyph.timerImage.image = UIImage(named: "glif11.png")!
        
        timerRosh.timerValue =  660
        timerGlyph.timerValue = 300
        

        //timerGlyph.progressIndicatorView.circleRadius = 30
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

