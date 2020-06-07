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
    var direction: Int = 1
    var isJumping: Bool = false
    var isGrappling: Bool = false

    var ropeJoint: SKPhysicsJointSpring!
    // MARK: Child Nodes
//    var grappleGun: GrappleGun!
//    var grapple: Grapple!
    
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
        pb.linearDamping = Constants.LegendSpeedDamping
        self.physicsBody = pb
        
        
//        self.grapple = Grapple()
//        self.grappleGun = GrappleGun()
//        self.addChild(self.grappleGun)
//        self.giveGun()
    }
    
    func swing(_ node: SKNode, _ contactPoint: CGPoint) {
        // remove existing joint before shooting new one
        print("swinging")
        
        guard let s = self.scene as? GameScene else {
            fatalError("No scene when attempting to grapple")
        }
        
        if let j = self.ropeJoint {
            s.physicsWorld.remove(j)
        }
        
        let newJoint = SKPhysicsJointSpring.joint(
            withBodyA: self.physicsBody!,
            bodyB: node.physicsBody!,
//            anchorA: self.position,
            anchorA: s.grappleGun.position,
            anchorB: contactPoint
        )
        
        self.ropeJoint = newJoint
        s.physicsWorld.add(newJoint)
        
    }
    
    func stopGrapple() {
        guard let s = self.scene as? GameScene else {
             fatalError("No scene when attempting to remove grapple")
         }
        if let j = self.ropeJoint {
            s.physicsWorld.remove(j)
        }
        if let gh = s.grappleHook {
            gh.removeFromParent()
        }
    }
//    func giveGun() {
        
//        let joint = SKPhysicsJointPin.joint(withBodyA: self.physicsBody!, bodyB: self.grappleGun.physicsBody!, anchor: Constants.Origin)
//        self.scene?.physicsWorld.add(joint)
//
        
//    }
    
    // MARK: Actions
    func move() {
        let moveForce = Constants.LegendAcceleration.dx
        let withDirection = moveForce * CGFloat(self.direction)
        let action = SKAction.applyForce(CGVector(dx: withDirection, dy: 0), duration: 0.1)
        self.run(action)
    }
    
    func jump() {
        let action = SKAction.applyImpulse(Constants.JumpForce, duration: 0.1)
        self.run(action)
    }
    
    func grapple() {
//        self.grappleGun.shoot()
    }
    
    func releaseGrapple() {
//        self.grappleGun.grapple.grappleCleanUp()
        // remove grapple from scene
        // reset position
        // clean up joint
    }
    
    // MARK: Touch Handlers
    func startMove(backwards: Bool = false) {
        if (backwards) {
            self.direction = -1
        } else {
            self.direction = 1
        }
        self.isMoving = true
    }
    
    func endMove() {
        self.isMoving = false
    }

    func startJump() {
        self.isJumping = true
        self.jump()
    }
    
    func endJump() {
        self.isJumping = false
    }
    
    func startGrapple(backwards: Bool = false) {
        self.isGrappling = true
        guard let s = self.scene as? GameScene else {
            fatalError("Couldn't find scene starting grapple")
        }
        s.grappleGun.shoot(backwards)
//        self.grapple(contactNode, contactPoint)
//        self.grapple.position = CGPoint(x: 3, y: 7)
//        self.addChild(self.grapple)
//        self.grapple.shoot()
//        print("starting: ", self.grapple.position)
        
    }
    
    func endGrapple() {
        self.isGrappling = false
        self.stopGrapple()
    }
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        guard let xVelo = self.physicsBody?.velocity.dx else {
            return
        }
        
        if (self.direction < 0) {
            self.xScale = -1
        } else {
            self.xScale = 1;

            print("backwards")
        }
        if self.isMoving {
            self.move()
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
