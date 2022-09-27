//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Kim Yewon on 2022/09/06.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let videoURL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else { fatalError("Detach video is failed") }
    
    videoPlayer = AVPlayer(url: videoURL)
    videoPlayer?.play()
    
    
    return videoPlayer!
}
