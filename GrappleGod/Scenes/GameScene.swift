//
//  GameScene.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
//    var legend: Legend
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
    }
    
    override func didMove(to view: SKView) {

        let legend = Legend(texture: nil, size: Constants.LegendSize)
        
        self.addChild(legend)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
