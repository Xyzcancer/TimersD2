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
        
       // self.bannerView.adUnitID = "ca-app-pub-7637463123579934/3407924800"
        self.bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        self.bannerView.rootViewController = self
        
        var request = GADRequest()
        
        self.bannerView.loadRequest(request)
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundDotaImage.jpeg")!)
        
        timerRosh.timerImage.image = UIImage(named: "roshan-dota-2-150x150.jpg")!
        timerGlyph.timerImage.image = UIImage(named: "roshan-dota-2-150x150.jpg")!
        
        timerRosh.timerValue =  720
        timerGlyph.timerValue = 300
        

        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

