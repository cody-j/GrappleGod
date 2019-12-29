//
//  GameScene.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit
import RealmSwift

class GameScene: SKScene, SKPhysicsContactDelegate, GameSceneProto {
    
    // MARK: Entities
    var legend: Legend!
    var world: World!
    var cameraNode: Camera!
    
    // Mark: Game Configuration
    var settings: Settings!
    
    // MARK: Game State
    var score: Int = 0
    var playerSpeed: CGFloat = 0

//    var powerup: Powerup
    
    override init(size: CGSize) {

        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0, y: 0)

        // Query Realm for game state from Realm
        settings = GameData.sharedInstance.getSettings()
        
        // Init Entites
        world = World()
        legend = Legend()
        
        // Set up camera
        cameraNode = Camera()
        cameraNode.configure(gameScene: self)

    }
    
    override func didMove(to view: SKView) {

        // Add Camera
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        let hud = HUD()
        cameraNode.addChild(hud)
        // Add Entities
        self.addChild(world)
        self.addChild(legend)
    }
    
    
    // MARK: Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let hud = self.cameraNode!.childNode(withName: "HUD")
            let location = touch.location(in: hud!)
            let touched = hud?.nodes(at: location)
            
            for node in touched! {
                switch node.name {
                case Constants.JumpName:
                    print("jumping")
                case Constants.GrappleName:
                    print("grappling")
                case Constants.MoveName:
                    print("moving")
                default:
                    print("hud element not registered")
                }
            }

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
        }
    }
    
    // MARK: Game Loop
    override func update(_ currentTime: TimeInterval) {
//        legend.update(gameScene: self)
    }
    
    override func didFinishUpdate() {
        cameraNode.update(gameScene: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
