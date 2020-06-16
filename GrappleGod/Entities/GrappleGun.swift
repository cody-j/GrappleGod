//
//  GrappleGun.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-31.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class GrappleGun: SKSpriteNode, Entity {
    
    var rope: SKShapeNode? = nil
    
    init(holsterTo: SKNode) {
        let grappleSize = CGSize(width: 20, height: 10)
        super.init(texture: SKTexture(imageNamed: "grapplegun"), color: .clear, size: grappleSize)
        self.name = Constants.GrappleName
        let pb = SKPhysicsBody(circleOfRadius: 6)
        pb.isDynamic = true
        pb.affectedByGravity = false
        pb.restitution = 0
        pb.allowsRotation = false
        pb.categoryBitMask = 0
        pb.collisionBitMask = 0
        pb.contactTestBitMask = 0

        let xlock = SKConstraint.positionX(SKRange(lowerLimit: 15, upperLimit: 15))
        let ylock = SKConstraint.positionY(SKRange(lowerLimit: 0, upperLimit: 0))
        xlock.referenceNode = holsterTo
        ylock.referenceNode = holsterTo
        
        self.constraints = [xlock, ylock]
//        self.physicsBody = pb
        
//        self.grapple = GrappleHook(
//        )
    }

    func shoot(_ backwards: Bool = false) {
        guard let s = self.scene as? GameScene else {
            fatalError("Couldn't get scene shooting")
        }
        print("Shooting")
        s.grappleHook = GrappleHook()
        s.grappleHook.position = self.position
        s.addChild(s.grappleHook)
        let legendDirection = s.legend.direction
        let dy = CGFloat(40)
        var dx = CGFloat(23)
        if let yVelo = s.legend.physicsBody?.velocity.dy {
            if (yVelo < 0) {
                dx = CGFloat(33)
            }
        }
        dx = dx * legendDirection
        let direction = CGVector(dx: dx, dy: dy)
        s.grappleHook.shoot(direction)
    }

    func update(gameScene: GameSceneProto) {
        if (self.rope != nil) {
            self.rope?.removeFromParent()
        }
        
        if (gameScene.legend.isGrappling) {
            guard let hook = gameScene.grappleHook else {
                return
            }
            
            self.rope = SKShapeNode()
            let ropePath = CGMutablePath()
            ropePath.move(to: self.position)
            ropePath.addLine(to: hook.position)
            self.rope?.path = ropePath
            self.rope?.strokeColor = SKColor.yellow
            gameScene.addChild(self.rope!)
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
