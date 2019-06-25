//
//  ViewController.swift
//  ringerProfile
//
//  Created by Soudamini Ambike on 25/06/19.
//  Copyright © 2019 Soudamini Ambike. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let audioSession = AVAudioSession.sharedInstance()
//        var volume: Float?
//        do {
//            try audioSession.setActive(true)
//            volume = audioSession.outputVolume
//        } catch {
//            print("Error Setting Up Audio Session")
//        }
//    }
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            self.label.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notify every 2 seconds
        Mute.shared.checkInterval = 2.0
        
        // Always notify on interval
        Mute.shared.alwaysNotify = true
        
        // Update label when notification received
        Mute.shared.notify = { [weak self] m in
            self?.label.text = m ? "Muted" : "Not Muted"
        }
        
        // Stop after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            Mute.shared.isPaused = true
        }
        
        // Re-start after 10 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            Mute.shared.isPaused = false
        }
    }

   

}

