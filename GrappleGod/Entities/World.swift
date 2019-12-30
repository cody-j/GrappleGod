//
//  World.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class World: SKNode, Entity {
    
    var worldXlimit: CGFloat = 4000
    
    override init() {
        super.init()
        
        self.generateStart()
        self.generateLevel()
    }
    
    
    
    func generateStart() {
        let startSize = Constants.StartPlatformSize
        let startNode = SKSpriteNode(texture: SKTexture(imageNamed: "platform_1"), size: startSize)
        
        let startPlatformTextures = [SKTexture(imageNamed: "platform_1"), SKTexture(imageNamed: "platform_2")]
        let platformAnimation = SKAction.repeatForever(SKAction.animate(with: startPlatformTextures, timePerFrame: 0.8))
        startNode.run(platformAnimation, withKey: "platform hover")
        startNode.position = CGPoint(x: 0, y: -200)
        startNode.name = "ground"
        let pb = SKPhysicsBody(texture: startNode.texture!, size: startSize)
        pb.affectedByGravity = false
        pb.allowsRotation = false
        pb.restitution = 0
        pb.friction = 0.6
        pb.isDynamic = false
        pb.categoryBitMask = Constants.GroundCat
        pb.collisionBitMask = Constants.LegendCat
        pb.contactTestBitMask = Constants.LegendCat
        
        startNode.physicsBody = pb
        
        self.addChild(startNode)
    }
    
    
    func generateGrapplePad() -> SKSpriteNode {
        let size = Constants.GrapplePadSize
        
        let node = SKSpriteNode(texture: SKTexture(imageNamed: "grapple_pad"), size: size)
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
            let yPosition = CGFloat(500)
            let padSpacing = CGFloat(600)
            let padDelta = Constants.GrapplePadSize.width + padSpacing
            
            let grapplePad = generateGrapplePad()
            let x = CGFloat(CGFloat(i) * padDelta)
        
            grapplePad.position = CGPoint(x: x, y: yPosition)
            self.addChild(grapplePad)
        }
    }
    
    func update(gameScene: GameSceneProto) {
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
