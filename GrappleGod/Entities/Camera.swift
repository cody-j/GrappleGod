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
        
        self.xScale = 2.5
        self.yScale = 2.5
    }
    
    func configure(gameScene: GameSceneProto) {
        self.setBackground(bounds: gameScene.frame.size)
    }

    func setBackground(bounds: CGSize) {
        let bg = SKSpriteNode(texture: SKTexture(imageNamed: "night_bkg"), size: CGSize(width: bounds.width, height: bounds.height))
        self.addChild(bg)
    }

    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        
        let legendPosition = gameScene.legend.position
        
        // Offset from bottom left
        let xOffset = CGFloat(470)
        let yOffset = CGFloat(120)
        
        let newX: CGFloat = legendPosition.x + xOffset
        let newY: CGFloat = legendPosition.y + yOffset
        
        
        self.position = CGPoint(x: newX, y: newY)
    }
    
    // MARK: Coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
