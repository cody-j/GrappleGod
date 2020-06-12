//
//  Constants.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import CoreGraphics
import UIKit

func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}

struct Constants {
    static let GameTitle: String = "Grapple God"
    static let GameSubTitle: String = "It's OK"

    // MARK: Button Names
    static let JumpName: String = "jump"
    static let GrappleName: String = "grapple"
    static let GrappleBackName: String = "grappleBack"
    static let MoveName: String = "move"
    static let MoveBackName: String = "moveBack"
    static let HomeName: String = "home"
    static let ActionButtonName: String = "ActionButton"
    // MARK: Category Masks
    static let GroundCat: UInt32 = 0x1 << 0 // 1
    static let RoofCat: UInt32 = 0x1 << 1 // 2
    static let LegendCat: UInt32 = 0x1 << 2 // 4
    static let GrappleCat: UInt32 = 0x1 << 3 // 8
    
    // MARK: World
    static let Origin = CGPoint(x: CGFloat(0), y: CGFloat(0))
    static let RoofSize: CGSize =  CGSize(width: 1000, height: 40)
    static let RoofHeight: CGFloat = CGFloat(400)
    static let GroundTileSize: CGSize =  CGSize(width: 1000, height: 400)
    static let GroundLevel = CGFloat(-600)
    static let Paralax_1: CGFloat = CGFloat(-0.2)
    static let StartPlatformSize: CGSize = CGSize(width: 120*3, height: 27*3)
    static let GrapplePadSize: CGSize = CGSize(width: 300*3, height: 50*3)
    static let DownPadSize: CGSize = CGSize(width: 300*3, height: 300*3)
    static let WorldBlocks: [String: Any] = [
        "straight": [
            "sprite":"grapple_pad",
            "size": Constants.GrapplePadSize,
            "yStart": 0,
            "yDelta": CGFloat(0)
        ],
        "down": [
            "sprite":"down_pad",
            "size": CGSize(width: 300*3, height: 300*3),
            "yStart": CGFloat(280),
            "yDelta": CGFloat(-280)
        ]
    ]
    
    // MARK: Colors
    static let BackgroundColor: UIColor = rgb(255, 233, 147)
    static let StartingBlockColor: UIColor = rgb(185, 141, 141)
    static let WorldColor: UIColor = rgb(77, 77, 77)
    
    // MARK: Legend
    static let LegendScalar: CGFloat = CGFloat(2.6)
    static let LegendSize: CGSize = CGSize(width: 17 * Constants.LegendScalar, height: 29 * Constants.LegendScalar)
    static let LegendStartPosition: CGPoint = CGPoint(x: 40, y: 180)
    static let LegendSpeedDamping: CGFloat = CGFloat(0)
    static let LegendAcceleration: CGVector = CGVector(dx: 400, dy: 0)
    static let LegendAccelerationDown: CGVector = CGVector(dx: 0, dy: -4000)
    static let JumpForce: CGVector = CGVector(dx: 0, dy: 630)
    static let SecondJumpForce: CGVector = CGVector(dx: 0, dy: 430)
    static let LegendMass: CGFloat = 100
    static let MaxVelocity: CGFloat = 1000
    
    // MARK: Grapple
    static let GrappleSize: CGSize = CGSize(width: 23, height: 23)
    static let ShootGrappleForce: CGVector = CGVector(dx: 20, dy: 40)
    static let ShootGrappleForceBackwards: CGVector = CGVector(dx: -20, dy: 40)
    
}
