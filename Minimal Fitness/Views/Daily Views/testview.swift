//
//  testview.swift
//  Minimal Fitness
//
//  Created by Harsha Amarasinghe on 2023-05-16.
//

import UIKit
import YouTubePlayerKit


class testview: UIViewController {
    
//    let youTubePlayerViewController = YouTubePlayerViewController(
//        player: "https://youtube.com/watch?v=psL_5RIBqnY"
//    )
    
    let youTubePlayer = YouTubePlayer(
        source: .video(id: "psL_5RIBqnY"),
        configuration: .init(
            autoPlay: false
        )
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //playerViewController.delegate = self
        //playerViewController.loadView(videoID)
        
       play()
        // Do any additional setup after loading the view.
    }
    
    func play(){
//        youTubePlayerViewController.player.showStatsForNerds()
//
//        YouTubePlayer("https://www.youtube.com/watch?v=3TbdoVhgQmE")
//
        youTubePlayer.source = .video(id: "0TD96VTf0Xs")
        
        //present(youTubePlayerViewController, animated: true, completion: nil)
        youTubePlayer.play()
    }

}
