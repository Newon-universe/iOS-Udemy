//
//  PlaySound.swift
//  Make some waves
//
//  Created by Kim Yewon on 2022/11/27.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(name: String, type: String) {
    if let path = Bundle.main.path(forResource: name, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            
        }
    }
}
