//
//  Grapple.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-29.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Grapple: SKSpriteNode, Entity {
    
    init() {
        let grappleSize = CGSize(width: 23, height: 23)
        super.init(texture: SKTexture(imageNamed: "grapple"), color: .clear, size: grappleSize)
        
        let pb = SKPhysicsBody(circleOfRadius: 9)
        pb.isDynamic = true
        pb.affectedByGravity = true
//        pb.density = 30
//        pb.restitution = 0
        pb.allowsRotation = false
//        pb.friction = 0.6
        pb.collisionBitMask = Constants.GrappleCat
        
        self.physicsBody = pb
    }
    
    func shoot(_ direction: CGVector = Constants.ShootGrappleForce) {
        let action = SKAction.applyImpulse(direction, duration: 0.1)
        self.run(action)
    }
    
    func update(gameScene: GameSceneProto) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
