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
    @IBOutlet weak var playButtomn: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var audioURL: URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRecorder()
        playButtomn.isEnabled = false
        addButton.isEnabled = false
        
    
    }

    func setupRecorder(){
        do {
        //Create an audio session
         let session = AVAudioSession.sharedInstance()
       try  session.setCategory(AVAudioSessionCategoryPlayAndRecord)
       try  session.overrideOutputAudioPort(.speaker)
       try   session.setActive(true)
        
        //Create URL for the audio
            let basePath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
           let pathComponents = [basePath,"audio.m4a"]
            audioURL = NSURL.fileURL(withPathComponents: pathComponents)
            
        //create settings for the audio recorder
            var settings: [String:Any] = [:]
            settings[AVFormatIDKey] = kAudioFormatMPEG4AAC
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
            
        
        //create AuodioRecorder object
        
        audioRecorder =  try AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder!.prepareToRecord()
        }catch  let error as NSError{
            print(error)
        }
    
    }
    
    @IBAction func recordTapped(_ sender: Any) {
        if audioRecorder!.isRecording {
            //stop the recording
              audioRecorder?.stop()
            //change button title to record
            recordButton.setTitle("Record", for: .normal)
            playButtomn.isEnabled = true
            addButton.isEnabled = true
        }else {
            //Start the recording
            audioRecorder?.record()
            //Change button title to Stop
            recordButton.setTitle("Stop", for: .normal)
        
        }
        
    }
    @IBAction func playTapped(_ sender: Any) {
        do {

            try audioPlayer = AVAudioPlayer(contentsOf: audioURL!)
            audioPlayer!.play()
        } catch{}
        
        
    }
    @IBAction func AddTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let sound = Sound(context: context)
        
        sound.name = nameTextField.text
        sound.audio = NSData(contentsOf: audioURL!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
}

