//
//  HUD.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

class HUD: SKNode, Entity {

    var score: CGFloat = 0
    var scoreText: String = ""
    var screenSize: CGSize!

    init(size: CGSize) {
        super.init()
        self.screenSize = size
        
        let centerX: CGFloat = self.frame.width/2
        let centerY: CGFloat = self.frame.height/2

        let moveBackButton = generateButton(name: Constants.MoveBackName, size: CGSize(width: 80, height: 80), position: CGPoint(x: centerX - 300, y: centerY - 80))
        let moveButton = generateButton(name: Constants.MoveName, size: CGSize(width: 80, height: 80), position: CGPoint(x: centerX - 200, y: centerY - 150))
        
        let jumpButton = generateButton(name: Constants.JumpName, position: CGPoint(x: centerX + 190, y: centerY - 140))
        let grappleButton = generateButton(name: Constants.GrappleName, position: CGPoint(x: centerX + 280, y: centerY - 80))
        let grappleBackButton = generateButton(name: Constants.GrappleBackName, position: CGPoint(x: centerX + 190, y: centerY - 30))
        
        self.name = "HUD"
        self.zPosition = 100
        self.addChild(jumpButton)
        self.addChild(grappleButton)
        self.addChild(grappleBackButton)
        self.addChild(moveButton)
        self.addChild(moveBackButton)
        self.addChild(generateScoreLabel())
    }
    
    func generateScoreLabel() -> SKLabelNode {
        let score = SKLabelNode(text: scoreText)
        
        let W = self.screenSize.width
        let H = self.screenSize.height
        let x = W/2 - 130
        let y = H/2 - 30
        score.name = "score"
        score.position = CGPoint(x: x, y: y)
        score.fontColor = .black
        score.fontSize = 20
        return score
    }
    
    func generateButton(name: String, size: CGSize = CGSize(width: 80, height: 80), position: CGPoint) -> SKSpriteNode {
        let button = SKSpriteNode(imageNamed: Constants.ActionButtonName)
        
        button.name = name
        button.size = size
        button.position = position
        return button
    }
    
    
    func update(gameScene: GameSceneProto) {
        
        let calculatedScore = Int(floor(gameScene.legend.position.x/20))
//        let calculatedY = Int(floor(gameScene.legend.position.y)) + 2000
        if let labelNode = self.childNode(withName: "score") as? SKLabelNode {
            labelNode.text = "\(calculatedScore)"
        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
