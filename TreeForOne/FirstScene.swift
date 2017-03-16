//
//  FirstScene.swift
//  TreeForOne
//
//  Created by Zhangzhengang on 17/3/15.
//  Copyright © 2017 Zhangzhengang. All rights reserved.
//

import Foundation
import SpriteKit

class FirstScene: SKScene ,SKPhysicsContactDelegate
{
    let gameLabel : SKLabelNode = SKLabelNode()
    let ball : SKSpriteNode = SKSpriteNode(imageNamed:"ball")
    var isGameing : Bool!
    
    
    
    override init(size: CGSize)
    {
        super.init(size: size)
    }
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView)
    {
        isGameing = false
        physicsBody = SKPhysicsBody(edgeLoopFrom:self.frame)
        physicsBody?.contactTestBitMask = 0b1
        physicsWorld.contactDelegate = self
        
        gameLabel.text = "点击开始游戏"
        gameLabel.position = CGPoint(x:(self.view?.center.x)!, y:((self.view?.frame.size.height)! - 200))
        addChild(gameLabel)
        
        ball.size = CGSize(width:50,height:50)
        ball.position = CGPoint(x:(self.view?.center.x)!, y:((self.view?.frame.size.height)! - 70))
        
        addChild(ball)
    }
    
    
    //MARK:- 碰撞检测回调
    func didBegin(_ contact: SKPhysicsContact)
    {
        let maskcode = contact.bodyA.contactTestBitMask | contact.bodyB.contactTestBitMask
        
        if maskcode == 0b100 | 0b1
        {
            if contact.bodyA.contactTestBitMask == 0b100
            {
                contact.bodyA.node?.removeFromParent()
            }
            if contact.bodyB.contactTestBitMask == 0b100
            {
                contact.bodyB.node?.removeFromParent()
            }
        }
        else if maskcode == 0b100 | 0b10
        {
            var randomNum:Int!
            if (contact.bodyA.node?.position.x)! < ((self.view?.frame.size.width)! / 2)
            {
                randomNum = Int(arc4random()%20 + 1)
            }
            else
            {
                randomNum = -Int(arc4random()%20 + 1)
            }
            print(randomNum)
            ball.physicsBody?.velocity = CGVector(dx: randomNum * 10, dy: 300)
        }
        else if maskcode == 0b10 | 0b1
        {
            self.view?.presentScene(GameOverScene(size: (self.view?.frame.size)!))
        }
    }
    
    
    //MARK:- 页面点击事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if isGameing == true
        {
            let flagName : String = "flag" + String(Int(arc4random()%11 + 1))
            let oneflag : SKSpriteNode = SKSpriteNode(imageNamed: flagName)
            addChild(oneflag)
            oneflag.position = (touches.first?.location(in: self))!
            oneflag.physicsBody = SKPhysicsBody(rectangleOf:oneflag.frame.size)
            oneflag.physicsBody?.velocity = CGVector(dx: 0,dy: 500)
            oneflag.physicsBody?.contactTestBitMask = 0b100
        }
        else
        {
            isGameing = true
            ball.physicsBody = SKPhysicsBody(rectangleOf:ball.frame.size)
            ball.physicsBody?.contactTestBitMask = 0b10
            ball.physicsBody?.restitution = 0.0
            gameLabel.isHidden = true;
        }
    }
}
    
