//
//  ViewController.swift
//  Egg Timer App
//
//  Created by Mahmut Şenbek on 20.10.2022.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var timerView: UIView!
    var timer = Timer()
    let eggTimer = ["Soft": 3,
                    "Medium": 5,
                    "Hard": 7]
    var passedTime = 0
    var totalTime = 0
    var player: AVAudioPlayer!
   
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
       
        
    }
   
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressBar.progress = 0
        labelText.text = hardness
        totalTime = 0
      //  print(eggTimer[hardness]!)
        totalTime = eggTimer[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(zaman), userInfo: nil, repeats: true)
        
       
       
    }
    @objc func zaman() {
        if passedTime < totalTime {
            passedTime += 1
            let progressPercent = Float(passedTime) / Float(totalTime)
            print(progressPercent)
            progressBar.progress = progressPercent
                print(passedTime)
             //  passedTime = 0
            
        }else {
           
            timer.invalidate()
            labelText.text = "Your egg is ready!"
            print("total time")
            playSound()
            passedTime = 0
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    
}

}
