//
//  PhysicsComponent.swift
//  GrappleGod
//
//  Created by codyj on 2020-01-12.
//  Copyright © 2020 The Local Bodega. All rights reserved.
//

import SpriteKit

enum BodyType {
    case prop
    case fixture
    case zone
}

class PhysicsComponent {
    
    var body: SKPhysicsBody
    
    init(
        bodyType: BodyType,
        size: CGSize,
        mask: UInt32,
        collidesWith: UInt32,
        
        // Defaults
        contactWith: UInt32 = 0,
        density: CGFloat = 1,
        resitution: CGFloat = 0,
        friction: CGFloat = 0.2
    ) {

        self.body = SKPhysicsBody()
        self.setupBody(bodyType)
        self.setupBodyCollisionMask(mask, collidesWith, contactWith)
        
    }
    
    
    private func setupBody(_ bodyType: BodyType) {
        switch bodyType {
            case BodyType.prop:
                self.body.isDynamic = true
                self.body.affectedByGravity = true
                self.body.allowsRotation = false
                
            case BodyType.fixture:
                self.body.isDynamic = false
                self.body.affectedByGravity = false
                self.body.allowsRotation = false
                
            default:
                print("bodyType missing from: ", #function)
        }
    }
    
    
    
    

    func getBody() -> SKPhysicsBody {
        return self.body
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
