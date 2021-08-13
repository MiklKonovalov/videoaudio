//
//  PlayerViewController.swift
//  AVFoundation_Audio
//
//  Created by Misha on 13.08.2021.
//

import UIKit

import youtube_ios_player_helper

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerViewTwo: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerViewTwo.load(withVideoId: "i12CvB_eWas")
        //playerView.load(withVideoId: "i12CvB_eWas")
    }
        

        
//        let videoURL = URL(string: "")
//        let player = AVPlayer(url: videoURL!)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//        }
    
}
