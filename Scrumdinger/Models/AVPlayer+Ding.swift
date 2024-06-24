//
//  AVPlayer+Ding.swift
//  Extract from Apple Developer Tutorials.
//

import Foundation
import AVFoundation

/* The sharedDingPlayer object plays the ding.wav resource. */

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
