//
//  MainMenuScene.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
       
    var button: SKLabelNode!

    var centerX: CGFloat!
    var centerY: CGFloat!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        
        self.centerX = self.frame.size.width/2
        self.centerY = self.frame.size.height/2
        
        self.backgroundColor = Constants.BackgroundColor
        
        self.generateTitle()
        self.generateGameStartButton()
        
    }
    
    func generateTitle() {
        let title = SKLabelNode(text: Constants.GameTitle)
        title.fontColor = .black
        title.fontSize = 90
        title.position = CGPoint(x: self.centerX, y: self.centerY + 30)
        self.addChild(title)
    }

    func generateGameStartButton() {
        button = SKLabelNode(text: "Game Start")
        button.fontColor = .black
        button.position = CGPoint(x: self.centerX, y: self.centerY - 80)
        self.addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if button!.contains(touch.location(in: self)) {
                self.view?.presentScene(GameScene(size: self.view!.frame.size))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
