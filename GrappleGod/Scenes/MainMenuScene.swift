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
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        self.backgroundColor = Constants.BackgroundColor
        
        self.generateTitle()
        self.generateGameStartButton()
        
    }
    
    func generateTitle() {
        let title = SKLabelNode(text: Constants.GameTitle)
        title.fontColor = .black
        title.fontSize = 90
        title.position = CGPoint(x: 0, y: 30)
        self.addChild(title)
    }

    func generateGameStartButton() {
        button = SKLabelNode(text: "Game Start")
        button.fontColor = .black
        button.position = CGPoint(x: 0, y: -80)
        self.addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if button!.contains(touch.location(in: self)) {
                self.view?.presentScene(GameScene(size: self.view!.bounds.size))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
