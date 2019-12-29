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

        let moveButton = generateButton(name: Constants.MoveName, size: CGSize(width: 120, height: 120), position: CGPoint(x: centerX - 260, y: centerY - 120))
        let jumpButton = generateButton(name: Constants.JumpName, position: CGPoint(x: centerX + 190, y: centerY - 140))
        let grappleButton = generateButton(name: Constants.GrappleName, position: CGPoint(x: centerX + 280, y: centerY - 40))
        
        self.name = "HUD"
        self.addChild(jumpButton)
        self.addChild(grappleButton)
        self.addChild(moveButton)
    }
    
    func generateButton(name: String, size: CGSize = CGSize(width: 80, height: 80), position: CGPoint) -> SKSpriteNode {
        let button = SKSpriteNode(imageNamed: Constants.ActionButtonName)
        
        button.name = name
        button.size = size
        button.position = position
        return button
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
