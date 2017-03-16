//
//  GameOverScene.swift
//  TreeForOne
//
//  Created by Zhangzhengang on 17/3/16.
//  Copyright © 2017年 Zhangzhengang. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene
{
    override init(size: CGSize)
    {
        super.init(size: size)
        
        let label = SKLabelNode()
        label.fontSize = 20.0
        label.text = "游戏结束，点击屏幕重新开始"
        label.position = CGPoint(x: size.width/2,y: size.height/2)
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view?.presentScene(FirstScene(size:(self.view?.frame.size)!), transition:SKTransition.crossFade(withDuration: 2.0))
    }
}
