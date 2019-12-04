//
//  Constants.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-03.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import CoreGraphics
import UIKit

struct Constants {
    static let GroundCat: UInt32 = 0x1 << 0 // 1
    static let RoofCat: UInt32 = 0x1 << 1 // 2
    static let LegendCat: UInt32 = 0x1 << 2 // 4
    static let GrappleCat: UInt32 = 0x1 << 3 // 8
    
    // MARK: World
    static let BackgroundColor: UIColor = UIColor(red: 255/255, green: 233/255, blue: 147/255, alpha: 1)
    static let WorldColor: UIColor = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
    static let RoofSize: CGSize =  CGSize(width: 1000, height: 40)
    static let RoofHeight: CGFloat = CGFloat(400)
    static let Paralax_1: CGFloat = CGFloat(-0.2)
    // MARK: Legend
    static let LegendScalar: CGFloat = CGFloat(2.6)
    static let LegendSize: CGSize = CGSize(width: 17 * Constants.LegendScalar, height: 29 * Constants.LegendScalar)
    static let LegendStartPosition: CGPoint = CGPoint(x: 40, y: 180)
    static let LegendMaxSpeed: CGFloat = CGFloat(1200)
    static let LegendAcceleration: CGVector = CGVector(dx: 300, dy: 0)
    static let LegendAccelerationDown: CGVector = CGVector(dx: 0, dy: -4000)
    static let JumpForce: CGVector = CGVector(dx: 0, dy: 16000)
    static let LegendMass: CGFloat = 100
}
