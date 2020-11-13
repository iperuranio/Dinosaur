//
//  GameScene.swift
//  Dinosaur
//
//  Created by Claudio Portuesi on 13/11/2020.
//

import SpriteKit

class GameScene: SKScene {
    
    var subTerrain: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createGround()
    }
}

extension GameScene {
    func createGround() {
        for i in 0...2 {
            let ground = SKSpriteNode(imageNamed: "")
            
        }
    }
}
