//
//  ViewController.swift
//  Simple Player
//
//  Created by Eder Mitten on 10/2/18.
//  Copyright © 2018 Eder Mitten. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "super-mario-world-intro-snes", ofType: "mp3")
    var timer = Timer()
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil , repeats: true)
        
    }
    
    @objc func updateScrubber() {
        scrubber.value = Float(player.currentTime)
    }
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        timer.invalidate()
        player.pause()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            
        }
        
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func scrubberMoved(_ sender: Any) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    @IBOutlet var scrubber: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            scrubber.maximumValue = Float(player.duration)
        } catch {
            
        }
    }


}

