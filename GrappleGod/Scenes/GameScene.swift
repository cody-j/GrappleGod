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
    var hud: HUD!
    
    // Mark: Game Configuration
    var settings: Settings!
    
    // MARK: Game State
    var score: Int = 0
    var playerSpeed: CGFloat = 0

    // MARK: Touches
    var moveTouch: UITouch?
    var jumpTouch: UITouch?
    var grappleTouch: UITouch?
    
    override init(size: CGSize) {

        super.init(size: size)
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0, y: 0)

        // Query Realm for game state from Realm
        settings = GameData.sharedInstance.getSettings()

    }
    
    override func didMove(to view: SKView) {
        // Init Entites
        world = World()
        legend = Legend()
        
        // Init/C camera
        cameraNode = Camera()
        cameraNode.configure(gameScene: self)
        
        // Init HUD
        print("size: ", self.view!.bounds.size)
        hud = HUD(size: self.view!.bounds.size)
        
        // Add HUD to camera tree
        cameraNode.addChild(self.hud)
        
        // Add cameraNode to root tree
        self.addChild(cameraNode)
        
        // Reference cameraNode as scene camera
        self.camera = cameraNode
        
        // Add Entities to root tree
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
                    self.jumpTouch = touch
                    self.legend.startJump()
                    
                case Constants.GrappleName:
                    self.grappleTouch = touch
                    self.legend.startGrapple()
                    
                case Constants.MoveName:
                    self.moveTouch = touch
                    self.legend.startMove()
                    
                default:
                    print("hud element not registered")
                }
            }

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            switch touch {
            case self.jumpTouch:
                self.legend.endJump()
                self.jumpTouch = nil
            
            case self.grappleTouch:
                self.legend.endGrapple()
                self.grappleTouch = nil
                
            case self.moveTouch:
                self.legend.endMove()
                self.moveTouch = nil
            
            default:
                print("do nothing")
            }
        }
    }
    
    // MARK: Game State
    func gameOver() -> Bool {
        let yLimit = CGFloat(-2000)
//        let xLimit = self.world.worldXlimit
        let legendY = self.legend.position.y
        let legendX = self.legend.position.x
        
        if legendY < yLimit {
            return true
        }
        
//        if legendX > xLimit {
//            return true
//        }
        
        return false
    }
    
    func restartGame() {
        self.legend.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.legend.position = Constants.Origin
    }
    
    // MARK: Game Loop
    override func update(_ currentTime: TimeInterval) {
        legend.update(gameScene: self)
    }
    
    override func didFinishUpdate() {
        hud.update(gameScene: self)
        cameraNode.update(gameScene: self)
        
        if gameOver() {
            restartGame()
        }
    }
    
    
    // MARK: Physics Contact Delegate
    func didBegin(_ contact: SKPhysicsContact) {
//        if contact.bodyB.node?.name == Constants.GrappleName {
//            print("start", self.legend.grapple.position)
//        }
        
        let A = contact.bodyA.node!
        let B = contact.bodyB.node!
        let isGrapple = B.name == Constants.GrappleName
        let isRoof = A.name == "roof"
        
        if isGrapple && isRoof {
            print(contact.contactPoint)
            print(self.legend.grapple.position)
            print("A", A.position)
            print("B", B.position)
            self.legend.grapple.hook(roof: contact.bodyA.node!, legend: self.legend, world: self.world, point: contact.contactPoint)
        }

    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let isGrapple = contact.bodyB.node?.name == Constants.GrappleName
        let isRoof = contact.bodyA.node?.name == "roof"

        if isGrapple && isRoof {
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
