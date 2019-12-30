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
    
    // MARK: Child Nodes
    var grapple: Grapple!
    
    init() {
        super.init(texture: SKTexture(imageNamed: "Up"), color: .clear, size: Constants.LegendSize)
        self.name = "legend"
        self.position = Constants.Origin
        
        let pb = SKPhysicsBody(rectangleOf: size)
        pb.isDynamic = true
        pb.affectedByGravity = true
        pb.density = 5
        pb.restitution = 0
        pb.allowsRotation = false
        pb.friction = 0.6
        pb.categoryBitMask = Constants.LegendCat
        pb.collisionBitMask = Constants.GroundCat
        pb.contactTestBitMask = 0
        self.physicsBody = pb
        
        
        self.grapple = Grapple()
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
        let action = SKAction.applyImpulse(Constants.JumpForce, duration: 0.1)
        self.run(action)
    }
    
    func endJump() {
        self.isJumping = false
    }
    
    func startGrapple() {
        self.isGrappling = true
        self.grapple.position = CGPoint(x: 3, y: 7)
        self.addChild(self.grapple)
        self.grapple.shoot()
//        print("starting: ", self.grapple.position)
        
    }
    
    func endGrapple() {
        self.isGrappling = false
        self.grapple.removeFromParent()
//        print("ending: ", self.grapple.position)
    }
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        
        if self.isMoving {
            let action = SKAction.applyForce(Constants.LegendAcceleration, duration: 0.1)
            self.run(action)
        }
        
//        if self.isJumping {
//            let action = SKAction.applyForce(Constants.JumpForce, duration: 0.1)
//            self.run(action)
//        }
        
//        if self.isGrappling {
//            
//        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
