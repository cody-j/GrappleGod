//
//  GameScene.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit
import RealmSwift

class GameScene: SKScene, SKPhysicsContactDelegate, GameSceneProto {
    
    // MARK: Entities
    var legend: Legend!
    var world: World!
    var cameraNode: Camera!
    
    // Mark: Game Configuration
    var settings: Settings!
    
    // MARK: Game State
    var score: Int = 0
    var playerSpeed: CGFloat = 0

//    var powerup: Powerup
    
    override init(size: CGSize) {

        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0, y: 0)

        // Query Realm for game state from Realm
        settings = GameData.sharedInstance.getSettings()
        
        // Init Entites
        world = World()
        legend = Legend()
        
        // Set up camera
        cameraNode = Camera()
        cameraNode.configure(gameScene: self)

    }
    
    override func didMove(to view: SKView) {

        // Add Camera
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        let hud = HUD()
        cameraNode.addChild(hud)
        // Add Entities
        self.addChild(world)
        self.addChild(legend)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        legend.update(gameScene: self)
    }
    
    override func didFinishUpdate() {
        cameraNode.update(gameScene: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
