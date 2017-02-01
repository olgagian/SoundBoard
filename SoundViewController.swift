//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by ioannis giannakidis on 31/01/2017.
//  Copyright © 2017 ioannis giannakidis. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    var audioRecorder:AVAudioRecorder? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setupRecorder(){
        do {
        //Create an audio session
         let session = AVAudioSession.sharedInstance()
       try  session.setCategory(AVAudioSessionCategoryPlayAndRecord)
       try  session.overrideOutputAudioPort(.speaker)
       try   session.setActive(true)
        
        //Create URL for the audio
        
        //create settings for the audio recorder
        
        //create AuodioRecorder object
        
        audioRecorder = AVAudioRecorder(url: <#T##URL#>, settings: <#T##[String : Any]#>)
        }catch {
        }
    
    }
    
    @IBAction func recordTapped(_ sender: Any) {
        
    }
    @IBAction func playTapped(_ sender: Any) {
    
    }
    @IBAction func AddTapped(_ sender: Any) {
    
    }

}

