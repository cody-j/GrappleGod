//
//  HUD.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class HUD: SKNode {

    
    override init() {
        super.init()
        
        let centerX: CGFloat = self.frame.width/2
        let centerY: CGFloat = self.frame.height/2

        let jumpButton = generateButton(name: Constants.JumpName, position: CGPoint(x: centerX + 200, y: centerY - 100))
        self.addChild(jumpButton)
    }
    
    func generateButton(name: String, buttonSize: CGSize = CGSize(width: 20, height: 20), position: CGPoint) -> SKSpriteNode {
        let button = SKSpriteNode(imageNamed: Constants.ActionButtonName)
        
        button.name = name
        button.size = buttonSize
        button.position = position
        return button
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
