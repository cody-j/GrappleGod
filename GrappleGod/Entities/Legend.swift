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
    var direction: CGFloat = 1
    var isJumping: Bool = false
    var isGrappling: Bool = false
    var jumpNumber: Int = 0
    var ropeJoint: SKPhysicsJointSpring!
    var legendState: String = "idle"
    var prevLegendState: String = "idle"
    // MARK: Child Nodes
//    var grappleGun: GrappleGun!
//    var grapple: Grapple!
    
    init() {
        super.init(texture: SKTexture(imageNamed: "falling"), color: .clear, size: Constants.LegendSize)
        self.name = "legend"
        self.position = Constants.Origin
        
        let pb = SKPhysicsBody(rectangleOf: size)
        pb.isDynamic = true
        pb.affectedByGravity = true
        pb.density = 5
        pb.restitution = 0
        pb.allowsRotation = false
        pb.friction = 0.6
        pb.mass = Constants.LegendMass
        pb.categoryBitMask = Constants.LegendCat
        pb.collisionBitMask = Constants.GroundCat
        pb.contactTestBitMask = 0
        pb.linearDamping = Constants.LegendSpeedDamping
        self.physicsBody = pb
        
    }
    
    func swing(_ node: SKNode, _ contactPoint: CGPoint) {
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
        
        self.jumpNumber = 1
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
    
    // MARK: Actions
    func move() {
        let moveForce = Constants.LegendAcceleration.dx
        let withDirection = moveForce * CGFloat(self.direction)
        let action = SKAction.applyForce(CGVector(dx: withDirection, dy: 0), duration: 0.1)
        self.run(action)
//        self.physicsBody?.velocity.dx = Constants.MaxVelocity * self.direction
    }
    
    func slowDown() {
        guard let xVelo = self.physicsBody?.velocity.dx else {
            return
        }
        
        if (xVelo == 0) {
            return
        }
        
        self.physicsBody?.velocity.dx = xVelo / 1.2
//        let moveForce = Constants.LegendAcceleration.dx
//        let withDirection = moveForce * CGFloat(self.direction * -1)
//        let action = SKAction.applyForce(CGVector(dx: withDirection, dy: 0), duration: 0.1)
//        self.run(action)
    }
    
    func resetJumpNumber () -> Void {
        self.jumpNumber = 0
    }
    
    func getJumpForce () -> CGVector {
        if (self.jumpNumber == 0) {
            return Constants.JumpForce
        } else if (self.jumpNumber == 1) {
            return Constants.SecondJumpForce
        }
        
        return CGVector(dx: 0, dy: 0)
    }
    
    func jump() {
        if (self.jumpNumber > 1) {
            return
        }
        guard let yVelo = self.physicsBody?.velocity.dy else {
            return
        }
        if (yVelo < CGFloat(0)) {
            self.physicsBody?.velocity.dy = 0
        }
        
        let force = getJumpForce()
        let action = SKAction.applyImpulse(force, duration: 0.1)
        self.run(action)
        if (self.jumpNumber == 1) {
            self.texture = SKTexture(imageNamed: "rolling")
            let animation = SKAction.animate(with: [SKTexture(imageNamed: "rolling")], timePerFrame: 0.5)
            self.run(animation)
        }
        self.jumpNumber += 1
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
    
    func startGrapple() {
        self.isGrappling = true
        guard let s = self.scene as? GameScene else {
            fatalError("Couldn't find scene starting grapple")
        }
        let backwards = self.direction > 0 ? false : true
        s.grappleGun.shoot(backwards)
    }
    
    func endGrapple() {
        self.isGrappling = false
        self.stopGrapple()
    }
    
    
    func clampVelo () -> Void {
        if (self.isGrappling) {
            return
        }
        let maxVelo = Constants.MaxVelocity
        
        guard let xVelo = self.physicsBody?.velocity.dx else {
            return
        }
        
        guard let yVelo = self.physicsBody?.velocity.dy else {
            return
        }
        
        var newXVelo = xVelo
        var newYVelo = yVelo
        
        if (xVelo > maxVelo) {
            newXVelo = maxVelo
        } else if (xVelo < -maxVelo) {
            newXVelo = -maxVelo
        }
        
        self.physicsBody?.velocity = CGVector(dx: newXVelo, dy: newYVelo)

        
    }

    func updateLegendSprite () {
        switch self.legendState {
        case "idle":
            self.texture = SKTexture(imageNamed: "Up")
        case "jumping":
            self.texture = SKTexture(imageNamed: "jumping")
        case "falling":
            self.texture = SKTexture(imageNamed: "falling")
        case "rolling":
            self.texture = SKTexture(imageNamed: "rolling")
        default:
            self.texture = SKTexture(imageNamed: "Up")
        }
    }

    func setLegendState () {
        guard let xVelo = self.physicsBody?.velocity.dx else {
            return
        }
        
        guard let yVelo = self.physicsBody?.velocity.dy else {
            return
        }
        
        if (yVelo > 0) {
            self.legendState = "jumping"
        } else if (yVelo < 0) {
            self.legendState = "falling"
        } else {
            self.legendState = "idle"
        }
        
    }
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        
        self.clampVelo()
        
        self.setLegendState()
        
        if (self.legendState != self.prevLegendState) {
            self.updateLegendSprite()
        }
        
        
        if (self.direction < 0) {
            self.xScale = -1
        } else {
            self.xScale = 1;
        }

        if self.isMoving {
            self.move()
        } else {
            if (!isGrappling && self.jumpNumber == 0) {
                self.slowDown()
            }
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
