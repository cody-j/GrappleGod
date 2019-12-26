//
//  Entity.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

protocol Entity: SKNode {
    
    func update(gameScene: GameSceneProto)
    
}
