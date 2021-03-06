//
//  GameViewController.swift
//  TreeForOne
//
//  Created by Zhangzhengang on 17/3/15.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = FirstScene(size:self.view.frame.size) {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                
//                // Present the scene
//                view.presentScene(scene)
//            }
//            view.ignoresSiblingOrder = true
//            
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
        let view = self.view as! SKView?
        view?.showsFPS = true
        view?.showsNodeCount = true
        view?.presentScene(FirstScene(size:self.view.frame.size))
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
