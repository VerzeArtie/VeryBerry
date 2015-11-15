//
//  XepherPlayer.swift
//  FlappyBerry
//
//  Created by Summer on 2015/01/26.
//  Copyright (c) 2015年 Altomo. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox
import AVFoundation

class XepherPlayer: NSObject, AVAudioPlayerDelegate {

    var player: AVAudioPlayer! = nil
    var aSoundID: SystemSoundID = 0
    
    override init() {
        super.init()
        
    }
    
    func StopMusic() {
        if (self.player == nil) { return }
        self.player.stop()
        self.player = nil
    }
    func PlayMusic(path:NSString, ext:NSString) {
        self.StopMusic()
        if (self.player == nil)
        {
            let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(path as String, ofType: ext as String)!)
            do {
            self.player = try AVAudioPlayer(contentsOfURL: audioPath)
            } catch {
                
            }
//            self.player = AVAudioPlayer(contentsOfURL: audioPath, fileTypeHint: nil)
            self.player.delegate = self
            self.player.prepareToPlay()
            self.player.numberOfLoops = -1
            
            //let aFileURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(path as String, ofType: ext as String)!)
            self.player.play()
            //        var error:OSStatus = AudioServicesCreateSystemSoundID(aFileURL, &aSoundID)
            //        //        if (aFileURL != nil)
            //        if (error != OSStatus(kAudioServicesNoError)) {
            //        }
        }
    }
    
    func PlaySound(path: NSString) {
        let aFileURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(path as String, ofType: "wav")!)
        //if (aFileURL != nil)
//        {
//            // create a SoundID.
//            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)aFileURL, &aSoundID);
//        }
        AudioServicesCreateSystemSoundID(aFileURL, &self.aSoundID)
        
        AudioServicesPlaySystemSound(self.aSoundID)	// play the sound.
    }

}