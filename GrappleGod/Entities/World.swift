//
//  World.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class World: SKNode, Entity {
    
    override init() {
        super.init()
        
        self.generateStart()
        self.generateLevel()
    }
    
    
    
    func generateStart() {
        let startSize = CGSize(width: 3000, height: 40)
        let startNode = SKSpriteNode(texture: SKTexture(imageNamed: "start"), size: startSize)
        startNode.position = CGPoint(x: 0, y: -200)
        startNode.name = "ground"
        let pb = SKPhysicsBody(texture: startNode.texture!, size: startSize)
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.restitution = 0.2
        pb.friction = 0.6
        pb.isDynamic = false
        pb.categoryBitMask = Constants.GroundCat
        pb.collisionBitMask = Constants.LegendCat
        pb.contactTestBitMask = Constants.LegendCat
        
        startNode.physicsBody = pb
        
        self.addChild(startNode)
    }
    
    
    func generateGrapplePad() -> SKSpriteNode {
        let size = CGSize(width: 220, height: 50)
        
        let node = SKSpriteNode(texture: SKTexture(imageNamed: "start"), size: size)
        node.name = "roof"
        let pb = SKPhysicsBody(texture: node.texture!, size: size)
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.isDynamic = false
        pb.restitution = 0
        pb.friction = 1
        pb.categoryBitMask = Constants.RoofCat
        pb.collisionBitMask = Constants.GrappleCat
        pb.contactTestBitMask = Constants.GrappleCat
        
        
        node.physicsBody = pb
        
        return node
    }
    
    
    func generateLevel() {
        for i in 0...6 {
            let grapplePad = generateGrapplePad()
            let y = CGFloat(100)
            let x = CGFloat(i*400)
        
            grapplePad.position = CGPoint(x: x, y: y)
            self.addChild(grapplePad)
        }
    }
    
    func update(gameScene: GameSceneProto) {}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
