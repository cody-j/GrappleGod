//
//  Grapple.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-29.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Grapple: SKSpriteNode, Entity {

    // MARK: Child Nodes
    var rope: SKPhysicsJointSpring!
    
    init() {
        let grappleSize = CGSize(width: 23, height: 23)
        super.init(texture: SKTexture(imageNamed: "grapple"), color: .clear, size: grappleSize)
        self.name = Constants.GrappleName
        let pb = SKPhysicsBody(circleOfRadius: 6)
        pb.isDynamic = true
        pb.affectedByGravity = true
//        pb.density = 30
        pb.restitution = 0
        pb.allowsRotation = false
        pb.friction = 10
        pb.categoryBitMask = Constants.GrappleCat
        pb.collisionBitMask = Constants.RoofCat | Constants.GroundCat
        pb.contactTestBitMask = Constants.RoofCat | Constants.GroundCat
        
        self.physicsBody = pb
    }
    
    func shoot(_ direction: CGVector = Constants.ShootGrappleForce) {
        let action = SKAction.applyImpulse(direction, duration: 0.1)
        self.run(action)
    }
    
    
    func hook(roof: SKNode, legend: SKNode, world: SKNode, point: CGPoint) {
        self.physicsBody?.isDynamic = false
        
        rope = SKPhysicsJointSpring.joint(withBodyA: roof.physicsBody!, bodyB: legend.physicsBody!, anchorA: point, anchorB: legend.convert(Constants.Origin, to: scene!))
        self.scene!.physicsWorld.add(rope)

//        rope.frequency = 4
//        rope.damping = 0.5
    }
    
    func removeHook() {
        if let s = scene {
            scene!.physicsWorld.remove(rope)
            self.physicsBody?.isDynamic = true
            self.removeFromParent()
        } else {
            fatalError("No fucking scene")
        }
        
        
        
    }
    
    
    func update(gameScene: GameSceneProto) {
        // Set angle to be in line with legend. Potentially redo pixel art to be proper angle, or just set image angle as ∆
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
