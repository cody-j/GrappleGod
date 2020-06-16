//
//  Grapple.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-29.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class GrappleHook: SKSpriteNode, Entity {

    // MARK: Child Nodes
    var rope: SKPhysicsJointSpring!
    var gun: GrappleGun!

    init() {
        let grappleSize = CGSize(width: 15, height: 15)
        super.init(texture: SKTexture(imageNamed: "grapple"), color: .clear, size: grappleSize)
        self.name = Constants.GrappleName
        let pb = SKPhysicsBody(circleOfRadius: 6)
        pb.isDynamic = true
        pb.affectedByGravity = false
//        pb.density = 30
        pb.restitution = 0
        pb.allowsRotation = false
        pb.friction = 10
        pb.categoryBitMask = Constants.GrappleCat
        pb.collisionBitMask = Constants.RoofCat // | Constants.GroundCat
        pb.contactTestBitMask = Constants.RoofCat // | Constants.GroundCat
        pb.usesPreciseCollisionDetection = true
        self.physicsBody = pb
//        self.gun = gun
    }

    func shoot(_ direction: CGVector = Constants.ShootGrappleForce) {
//        guard let s = self.scene as? GameScene else {
//            fatalError("Couldn't get scene shooting")
//        }
        if (direction.dx < 0) {
            self.xScale = -1
        }
        let action = SKAction.applyImpulse(direction, duration: 0.1)
            
        self.run(action)
    }
    
//    func grappleHit(_ contactPoint: CGPoint, _ roofBody: SKPhysicsBody) {
////        self.physicsBody!.isDynamic = false
//        print("hit!")
//        let s = self.scene as! GameScene
//        let gunBody = s.legend.physicsBody! // self.gun.physicsBody!
//        let grappleBody = roofBody
//        let gunAnchor = gun.convert(Constants.Origin, to: self.scene!)
//        let grappleAnchor = contactPoint
//
//        rope = SKPhysicsJointSpring.joint(
//            withBodyA: gunBody,
//            bodyB: grappleBody,
//            anchorA: gunAnchor,
//            anchorB: grappleAnchor
//        )
//
//        self.scene!.physicsWorld.add(rope)
//    }
    
//    func grappleCleanUp() {
//        self.scene!.physicsWorld.remove(rope)
//        rope = nil
//        self.removeFromParent()
//    }
//    func shoot(_ direction: CGVector = Constants.ShootGrappleForce) {
//        let action = SKAction.applyImpulse(direction, duration: 0.1)
//        self.run(action)
//    }
//    
//    
//    func hook(roof: SKNode, legend: SKNode, world: SKNode, point: CGPoint) {
//        self.physicsBody?.isDynamic = false
//        
//        rope = SKPhysicsJointSpring.joint(withBodyA: roof.physicsBody!, bodyB: legend.physicsBody!, anchorA: CGPoint(x: point.x - 11, y: point.y - 23), anchorB: legend.convert(Constants.Origin, to: scene!))
//        self.scene!.physicsWorld.add(rope)
//
////        rope.frequency = 4
////        rope.damping = 0.5
//    }
//    
//    func removeHook() {
//        if let s = scene {
//            scene?.physicsWorld.remove(rope)
//            self.physicsBody?.isDynamic = true
//            self.removeFromParent()
//        } else {
//            fatalError("No fucking scene")
//        }
//        
//        
//        
//    }
    
    
    func update(gameScene: GameSceneProto) {
        // Set angle to be in line with legend. Potentially redo pixel art to be proper angle, or just set image angle as ∆
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
