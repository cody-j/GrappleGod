//
//  Legend.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class Legend: SKSpriteNode, Entity {
    
    override init(texture: SKTexture!, color: SKColor!, size: CGSize) {
        super.init(texture: SKTexture(imageNamed: "Up"), color: .clear, size: size)
        
        self.position = Constants.Origin
    }
    
    
    // MARK: Update
    func update(gameScene: GameSceneProto) {
        print("Hello")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
