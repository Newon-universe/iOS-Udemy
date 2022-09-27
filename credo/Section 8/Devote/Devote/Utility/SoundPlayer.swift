//
//  SoundPlayer.swift
//  Devote
//
//  Created by Kim Yewon on 2022/09/14.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else { fatalError("Can not find path") }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    } catch {
        print("Could not find any play the sound file.")
    }
}
