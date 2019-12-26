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
        self.position = CGPoint(x: 0, y: 0)
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
