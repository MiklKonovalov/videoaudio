//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation
import WebKit
import AVKit

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
        
        //ПЕРЕХОД НА ДРУГОЙ КОНТРОЛЛЕР
        guard let videoViewController = storyboard?.instantiateViewController(identifier: "video") as? VideoViewController else { return }
        present(videoViewController, animated: true, completion: nil)
        
        //AVFoundation
        /*let videoURL = URL(string: "https://r1---sn-p5qs7ner.googlevideo.com/videoplayback?expire=1631753392&ei=UEBCYanUFvCI2LYP5amK2A8&ip=173.245.203.40&id=o-AGZPt6dACUWEpEmgiEkkKGyuvo9jtGCeAYBBUTzZsIXb&itag=22&source=youtube&requiressl=yes&mh=xg&mm=31%2C29&mn=sn-p5qs7ner%2Csn-p5qlsnz6&ms=au%2Crdu&mv=m&mvi=1&pl=27&pcm2=no&initcwndbps=658750&vprv=1&mime=video%2Fmp4&ns=cFVC3pfCe0QTfhfspTgzliUG&ratebypass=yes&dur=176.100&lmt=1631628775455890&mt=1631731733&fvip=1&fexp=24001373%2C24007246&beids=9466585&c=WEB&txp=5532434&n=hkuiHLWms-TDsQ7u&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cpcm2%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAP_Rg6vdLiNy0uLC_l0YvtKjACbhfLRH2grO59S-rl8iAiEAsKUkszNuV913iMekZAcBeOS0wdgMXy2fMW5tFuHeLS8%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhALNs3WXNpN2HVR6Hj4ZsTZOnwEp6mnwAjbSgnmb3ctShAiBrYequBert0mzAVY-nzoXJsmTrKhoXywznYlnx8Pt_Lg%3D%3D&title=CGI%20Animated%20Short%20Film%3A%20%22Watermelon%20A%20Cautionary%20Tale%22%20by%20Kefei%20Li%20%26%20Connie%20Qin%20He%20%7C%20CGMeetup")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }*/
        
        //WKWEBKIT
        /*var webView: WKWebView?
        let webViewConfig = WKWebViewConfiguration()
        
        webViewConfig.allowsAirPlayForMediaPlayback = true
        webView = WKWebView(frame: self.view.frame, configuration: webViewConfig)
        
        let myURL = URL(string: "https://www.youtube.com/watch?v=lTxn2BuqyzU?autoplay=1")
        let youtubeRequest = URLRequest(url: myURL!)
        
        webView?.load(youtubeRequest)*/
        
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
