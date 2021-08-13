//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var player: AVAudioPlayer!
    var player2: AVAudioPlayer!
    var player3: AVAudioPlayer!
    var player4: AVAudioPlayer!
    var player5: AVAudioPlayer!
    
    var session: AVCaptureSession!
    var input: AVCaptureDeviceInput!
    
    var isNeededToRecord = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //First track
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Queen", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        //Second track
        do {
            player2 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "1071 min", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        //Third track
        do {
            player3 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Давай дружище", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        //Fourth track
        do {
            player4 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "хранители", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        //Fifth track
        do {
            player5 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Мое небо 2", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
        
    }

    @IBAction func PlayButton(_ sender: Any) {
        player.play()
        songNameLabel.text = "Queen"
    }
    
    @IBAction func StopButton(_ sender: Any) {
        if player.isPlaying {
            if player.isPlaying == true {
                player.stop()
                player.currentTime = 0
            } else {
                player.play()
            }
        } else if player2.isPlaying {
            if player2.isPlaying == true {
                player2.stop()
                player2.currentTime = 0
            } else {
                player2.play()
            }
        } else if player3.isPlaying {
            if player3.isPlaying == true {
                player3.stop()
                player3.currentTime = 0
            } else {
                player3.play()
            }
        } else if player4.isPlaying {
            if player4.isPlaying == true {
                player4.stop()
                player4.currentTime = 0
            } else {
                player4.play()
            }
        } else if player5.isPlaying {
            if player5.isPlaying == true {
                player5.stop()
                player5.currentTime = 0
            } else {
                player5.play()
            }
        }
    }
    
    @IBAction func PauseButton(_ sender: Any) {
        if player.isPlaying {
            player.stop()
        } else if player2.isPlaying {
            player2.stop()
        } else if player3.isPlaying {
            player3.stop()
        } else if player4.isPlaying {
            player4.stop()
        } else if player5.isPlaying {
            player5.stop()
        }
        
    }
    
    @IBAction func RecordButton(_ sender: Any) {
        isNeededToRecord = true
        configuration()
    }
    
    @IBAction func nextTrack(_ sender: Any) {
        
        if player.isPlaying {
            player.stop()
            player2.play()
            songNameLabel.text = "Город"
        } else if player2.isPlaying {
            player2.stop()
            player3.play()
            songNameLabel.text = "Давай дружище"
        } else if player3.isPlaying {
            player3.stop()
            player4.play()
            songNameLabel.text = "Хранители"
        } else if player4.isPlaying {
            player4.stop()
            player5.play()
            songNameLabel.text = "Моё небо"
        }
    }
    
    @IBAction func previousTrack(_ sender: Any) {
        if player5.isPlaying {
            player5.stop()
            player4.play()
            songNameLabel.text = "Хранители"
        } else if player4.isPlaying {
            player4.stop()
            player3.play()
            songNameLabel.text = "Давай дружище"
        } else if player3.isPlaying {
            player3.stop()
            player2.play()
            songNameLabel.text = "Город"
        } else if player2.isPlaying {
            player2.stop()
            player.play()
            songNameLabel.text = "Queen"
        }
    }
    
    @IBOutlet var songNameLabel: UILabel!
    
    func configuration() {
        self.session = AVCaptureSession()
        self.session.beginConfiguration()
        self.session.sessionPreset = .high
        
        let device = AVCaptureDevice.default(
            .builtInMicrophone,
            for: .audio,
            position: .unspecified
        )
        
        self.input = try! AVCaptureDeviceInput(device: device!)
        self.session.addInput(input)
        
        let output = AVCaptureVideoDataOutput()
        //Создаём очередь на которой будет происходить обработка котента
        let queue = DispatchQueue(label: "record", qos: .userInitiated)
        output.setSampleBufferDelegate(self, queue: queue)
        self.session.addOutput(output)
        self.session.commitConfiguration()
        self.session.startRunning()
    }
    
    @IBAction func watchVideoButton(_ sender: Any) {
        
        let videoViewController = VideoViewController()
        navigationController?.pushViewController(videoViewController, animated: true)
        
    }
}

extension ViewController: AVCaptureAudioDataOutputSampleBufferDelegate {
    
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        //quard isNeededToRecord else { return }
    }
}
