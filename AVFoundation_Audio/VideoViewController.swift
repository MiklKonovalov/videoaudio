//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by Misha on 13.08.2021.
//

import UIKit
import AVKit
import youtube_ios_player_helper

struct Video {
    let title: String
    let id: String
}

class VideoViewController: UIViewController {
 
    private let data: [Video] = [
        Video(title: "Video1", id: "8Tl1RL8MRCA"),
        Video(title: "Video2", id: "5L4DQfVIcdg"),
        Video(title: "Video3", id: "H9154xIoYTA"),
        Video(title: "Video4", id: "07d2dXHYb94"),
        Video(title: "Video5", id: "9MO1aY1xC80"),
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension VideoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //YOUTUBE HELPER
        let video = data[indexPath.row].id
        
        guard let playerViewController = storyboard?.instantiateViewController(identifier: "player", creator: { coder in
            return PlayerViewController(coder: coder, selectedVideo: video)
        }) else {
            fatalError("Failed to load EditUserViewController from storyboard.")
        }
        present(playerViewController, animated: true, completion: nil)
            
    }
    
}

extension VideoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row].title
        
        return cell
    }
    
}
