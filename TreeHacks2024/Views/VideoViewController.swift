//
//  VideoViewController.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/18/24.
//

import AVKit
import SwiftUI

struct VideoViewController: UIViewControllerRepresentable {
    var videoURL: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.player = player
        controller.player?.play()
//        controller.showsPlaybackControls = true
//        controller.entersFullScreenWhenPlaybackBegins = true

        return controller
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {}
}
