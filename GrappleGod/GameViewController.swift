//
//  GameViewController.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-02.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
//            let scene = MainMenuScene(size: view.bounds.size)
            
            view.showsFPS = true
            view.showsPhysics = true
            view.presentScene(scene)
        }

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
