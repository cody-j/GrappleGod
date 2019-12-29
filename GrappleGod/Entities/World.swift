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

        let startNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlainHorizontal"), size: CGSize(width: 1400, height: 20))
        startNode.position = CGPoint(x: -100, y: -200)

        let pb = SKPhysicsBody(texture: startNode.texture!, size: CGSize(width: 1400, height: 20))
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.restitution = 0.2
        pb.friction = 0.6
        pb.isDynamic = false
        pb.categoryBitMask = Constants.LegendCat
        
        startNode.physicsBody = pb
        
        self.addChild(startNode)
    }
    
    func update(gameScene: GameSceneProto) {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
