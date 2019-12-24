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
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(texture: SKTexture!, size: CGSize) {
        self.init(texture: SKTexture(imageNamed: "Up"), color: .clear, size: size)
        
        self.position = CGPoint(x: CGFloat(100), y: CGFloat(100))
    }
    
    func update() {
        print("Hello")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
