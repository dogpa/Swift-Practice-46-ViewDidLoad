//
//  secondPageViewController.swift
//  Swift Practice # 46 ViewDidLoad
//
//  Created by CHEN PEIHAO on 2021/7/27.
//

import UIKit
import AVFoundation

class secondPageViewController: UIViewController {
    
    //背景音樂
    let player = AVPlayer()

    
    //漸層的function
    
    func GradientBackground () {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)),
            CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)),
            CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)),
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    //大麥町隨機大小跑步function
    
    func dogRun () {
        let gifVIew = UIImageView(frame: CGRect(x: 50, y: 600, width: CGFloat.random(in: 50...100)*3, height: CGFloat.random(in: 50...100)*2))
        view.addSubview(gifVIew)
        gifVIew.animationDuration = 0.2
        
        let dogRunGif = UIImage.animatedImageNamed("dog-", duration: 0)
        gifVIew.image = dogRunGif
        
    }
    
    //下皮卡丘雨的func
    func pikaRain () {
        let pikaEmitterCell = CAEmitterCell()
        pikaEmitterCell.contents = UIImage(named: "pika")?.cgImage
        pikaEmitterCell.birthRate = 1
        pikaEmitterCell.lifetime = 10
        pikaEmitterCell.velocity = 100
        pikaEmitterCell.scale = 0.1
        pikaEmitterCell.scaleRange = 0.3
        pikaEmitterCell.spin = 0.9
        pikaEmitterCell.spinRange = 1
        pikaEmitterCell.yAcceleration = 40
        let pikaEmitterLayer = CAEmitterLayer()
        pikaEmitterLayer.emitterCells = [pikaEmitterCell]
        
        pikaEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        pikaEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        pikaEmitterLayer.emitterShape = .line
        view.layer.addSublayer(pikaEmitterLayer)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dogRun()
        GradientBackground()
        pikaRain()
        let fileUrl = Bundle.main.url(forResource: "pikasong", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playItem)
        player.play()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
