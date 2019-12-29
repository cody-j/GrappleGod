//
//  Legend.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Legend: SKSpriteNode, Entity {
    
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
    
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        print("hello")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
