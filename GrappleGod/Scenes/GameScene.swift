//
//  GameScene.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit
import RealmSwift

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Mark: Entities
    var legend: Entity!
    
    // Mark: Game Configuration
    var settings: Settings?
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        
        // Query Realm for game state from Realm
        settings = GameData.sharedInstance.getSettings()
        
        // Init Entites
        legend = Legend(texture: nil, size: Constants.LegendSize)
        
    }
    
    override func didMove(to view: SKView) {
        
        // Add Entities
        self.addChild(legend)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
