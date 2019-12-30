//
//  Camera.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Camera: SKCameraNode, Entity {
    
    override init() {
        super.init()

        self.name = "Camera"
        self.position = Constants.Origin
        
    }
    
    func configure(gameScene: GameSceneProto) {
        self.setBackground(bounds: gameScene.frame.size)
    }

    func setBackground(bounds: CGSize) {
//        let bgX = -(bounds.width/2)
//        let bgY = -(bounds.height/2)
        let bg = SKSpriteNode(texture: SKTexture(imageNamed: "bkg"), size: CGSize(width: bounds.width, height: bounds.height))
//        let bg = SKShapeNode(rect: CGRect(origin: CGPoint(x: bgX, y: bgY), size: bounds))
//        bg.fillColor = Constants.BackgroundColor
        
        self.addChild(bg)
    }
    
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        
        let legendPosition = gameScene.legend.position
        
        let xOffset = CGFloat(170)
        let yOffset = CGFloat(40)
        
        let newX: CGFloat = legendPosition.x + xOffset
        let newY: CGFloat = legendPosition.y + yOffset
        
        self.position = CGPoint(x: newX, y: newY)
    }
    
    // MARK: Coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
