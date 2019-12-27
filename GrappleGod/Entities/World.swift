//
//  World.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class World: SKNode, Entity {
    
    override init() {
        super.init()
        
        self.generateStart()
        
    }
    
    
    func generateStart() {
        let startHeight = 30
        let startWidth = 200
        let startOrigin = CGPoint(x: 0, y: 0)
        
        let startSize = CGSize(width: startWidth, height: startHeight)
        let startRect = CGRect(origin: startOrigin, size: startSize)
        
        let startNode = SKShapeNode(rect: startRect)
        
        // Configure physicsbody
        let pb = SKPhysicsBody(rectangleOf: startSize)
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.restitution = 0.2
        pb.friction = 0.6
        pb.isDynamic = true
        
        startNode.physicsBody = pb
        startNode.fillColor = Constants.StartingBlockColor
        
        self.addChild(startNode)
    }
    
    func update(gameScene: GameSceneProto) {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
