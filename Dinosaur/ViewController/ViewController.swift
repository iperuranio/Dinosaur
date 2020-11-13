//
//  ViewController.swift
//  Dinosaur
//
//  Created by Claudio Portuesi on 13/11/2020.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    var isGameStarted = false
    @IBOutlet weak var playButton: UIImageView!
    @IBOutlet weak var titleImage: UIImageView!
    var backgroundMenu: UIImageView? = nil
    var backgroundGame: UIImageView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backgroundMenu = view.createFullscreenView(image: UIImage(named: "Menu")!)
        backgroundGame = view.createFullscreenView(image: UIImage(named: "DayLevel")!)
        
        mainMenu()
        
    }
    
    func mainMenuButtons() {
        //playButton.resize(targetSize: CGSize(width: 100, height: 100))
        
        //self.view.addSubview(playButton)
        initializePlayButton()
        initializeTitle()
    }
    
    func mainMenu() {
        view.addBackground(image: backgroundMenu!)
        mainMenuButtons()
    }
    
    func setGameBackground() {
        //let y = self.view.layer.bounds.maxY;
        
        //let verticalOffset = y * 0.4
        //backgroundGame!.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: verticalOffset).isActive = true
        view.addBackground(image: backgroundGame!)
    }
    
    func startGame() {
        hideMainMenu()
        setGameBackground()
        
        presentScene()
    }
    
    func presentScene() {
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            
        }
    }
    
    func hideMainMenu() {
        backgroundMenu!.removeFromSuperview()
        playButton.removeFromSuperview()
        titleImage.removeFromSuperview()
    }
    
    func initializeTitle() {
        let y = self.view.layer.bounds.maxY;
        let x = self.view.layer.bounds.maxX;
        
        let verticalOffset = y * -0.18
        
        let width = x * 0.75
        let height = y * 0.75
        
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: verticalOffset).isActive = true
        titleImage.centerXAnchor.constraint(lessThanOrEqualTo: self.view.centerXAnchor).isActive = true
        titleImage.resize(targetSize: CGSize(width: width, height: height))
        
        self.view.addSubview(titleImage)
    }
    
    func initializePlayButton() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onPlayButton))
        view.addGestureRecognizer(tap)
        
        let y = self.view.layer.bounds.maxY;
        let x = self.view.layer.bounds.maxX;
        
        let verticalOffset = y * 0.13
        
        let width = x * 0.225
        let height = y * 0.225
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerYAnchor.constraint(lessThanOrEqualTo: self.view.centerYAnchor, constant: verticalOffset).isActive = true
        playButton.centerXAnchor.constraint(lessThanOrEqualTo: self.view.centerXAnchor).isActive = true
        playButton.resize(targetSize: CGSize(width: width, height: height))
        
        self.view.addSubview(titleImage)
    }
    
    @objc func onPlayButton() {
        if(isGameStarted) {
            return
        }
        
        startGame()
        isGameStarted = true
    }
}

