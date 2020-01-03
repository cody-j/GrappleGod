//
//  GrappleGun.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-31.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class GrappleGun: SKSpriteNode, Entity {
    
//    var grapple: GrappleHook!
    
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

    func shoot() {
        guard let s = self.scene as? GameScene else {
            fatalError("Couldn't get scene shooting")
        }
        print("Shooting")
        s.grappleHook = GrappleHook()
        s.grappleHook.position = self.position
        s.addChild(s.grappleHook)
        s.grappleHook.shoot()
    }

    func update(gameScene: GameSceneProto) {
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
