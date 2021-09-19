//
//  PlayerViewController.swift
//  AVFoundation_Audio
//
//  Created by Misha on 16.09.2021.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var player: YTPlayerView!
    
    var selectedVideo: String
    
    init?(coder: NSCoder, selectedVideo: String) {
        self.selectedVideo = selectedVideo
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a string.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        player?.load(withVideoId: selectedVideo)
        
    }
    
}
