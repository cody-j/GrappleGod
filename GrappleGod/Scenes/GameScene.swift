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
    var cameraNode: Camera!
    
    // Mark: Game Configuration
    var settings: Settings!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0, y: 0)

        // Query Realm for game state from Realm
        settings = GameData.sharedInstance.getSettings()
        
        // Init Entites
        legend = Legend(texture: nil, size: Constants.LegendSize)

        cameraNode = Camera()
    }
    
    override func didMove(to view: SKView) {
        
        // Add Entities
        self.addChild(legend)
        self.camera = cameraNode
    }
    
    override func update(_ currentTime: TimeInterval) {
//        legend.update()
        cameraNode.update(gameScene: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
