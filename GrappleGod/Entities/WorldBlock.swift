//
//  WorldBlock.swift
//  GrappleGod
//
//  Created by codyj on 2020-01-02.
//  Copyright © 2020 The Local Bodega. All rights reserved.
//

import SpriteKit

class WorldBlock: SKSpriteNode, Entity {
    init(blockType: String, x: CGFloat, y: CGFloat) {
        let blocks = Constants.WorldBlocks
        
        guard let block = blocks[blockType] as? [String: Any] else {
            print("couldn't get straight block")
            fatalError("Could not load block \("straight")")
        }
        
        let yDelta = block["yDelta"] as! CGFloat
        let size = block["size"] as! CGSize
        let sprite = block["sprite"] as! String
        
        print("yDelta", yDelta)
        print("size", size)
        print("sprite", sprite)

        super.init(texture: SKTexture(imageNamed: sprite), color: .clear, size: size)
        
        self.name = "roof"
        self.position = CGPoint(x: x, y: y)
//        let pb = SKPhysicsBody(rectangleOf: size)
        let pb = SKPhysicsBody(texture: self.texture!,
                               size: size)
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.isDynamic = false
        pb.restitution = 0
        pb.friction = 1
        pb.categoryBitMask = Constants.RoofCat
        pb.collisionBitMask = Constants.GrappleCat
        pb.contactTestBitMask = Constants.GrappleCat
        
        self.physicsBody = pb
    }
    
    func update(gameScene: GameSceneProto) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
