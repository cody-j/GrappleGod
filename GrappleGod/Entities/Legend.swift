//
//  Legend.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Legend: SKSpriteNode, Entity {
    
    // MARK: Legend State
    var isMoving: Bool = false
    var isJumping: Bool = false
    var isGrappling: Bool = false
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Up"), color: .clear, size: Constants.LegendSize)
        
        self.position = Constants.Origin
        
        let pb = SKPhysicsBody(rectangleOf: size)
        pb.isDynamic = true
        pb.affectedByGravity = true
        pb.density = 5
        pb.restitution = 0
        pb.allowsRotation = false
        pb.friction = 0.6
        pb.collisionBitMask = Constants.LegendCat

        self.physicsBody = pb
        self.name = "Legend"
    }
    
    
    // MARK: Actions
    func startMove() {
        self.isMoving = true
    }
    
    func endMove() {
        self.isMoving = false
    }

    func startJump() {
        self.isJumping = true
    }
    
    func endJump() {
        self.isJumping = false
    }
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        // Move if moving
        if self.isMoving {
            let action = SKAction.applyForce(Constants.LegendAcceleration, duration: 0.1)
            self.run(action)
        }
        
        if self.isJumping {
            let action = SKAction.applyForce(Constants.JumpForce, duration: 0.1)
            self.run(action)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
