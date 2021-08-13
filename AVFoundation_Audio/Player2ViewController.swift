//
//  Player2ViewController.swift
//  AVFoundation_Audio
//
//  Created by Misha on 13.08.2021.
//

import UIKit
import AVKit

class Player2ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let videoURL = URL(string: "https://www.youtube.com/embed/0XBz9lyYStA")
        let player = AVPlayer(url: videoURL!)
        let player2ViewController = AVPlayerViewController()
        player2ViewController.player = player
        self.present(player2ViewController, animated: true) {
            player2ViewController.player!.play()
        }
    }
}
