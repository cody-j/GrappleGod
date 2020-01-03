//
//  GameSceneProto.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import SpriteKit

protocol GameSceneProto: SKScene {
    
    var legend: Legend! { get }
    var world: World! { get }
    var grappleHook: GrappleHook! { get set }
    var grappleGun: GrappleGun! { get set }
    
}
