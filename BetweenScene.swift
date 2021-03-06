//
//  BetweenScene.swift
//  GravityPuzzle
//
//  Created by Casey Manning on 7/13/16.
//  Copyright © 2016 Casey Manning. All rights reserved.
//

import Foundation
import SpriteKit

class BetweenScene: SKScene{
    
    var button: MSButtonNode2!
    var gameManager = GameManager.sharedInstance
    
    override func didMoveToView(view: SKView) {
        print("Level is \(gameManager.level)")
        if gameManager.level+1 == LevelSelect().numLevels {
            let action = SKAction.runBlock({ () -> Void in
            let skView = self.view
            let scene = Credits(fileNamed:"Credits")!
            scene.scaleMode = .AspectFill
            self.gameManager.levelsCompleted += 1
            skView!.presentScene(scene, transition: SKTransition.crossFadeWithDuration(5))
            })
            runAction(action)
            return
        }
        gameManager.level += 1
        button = childNodeWithName("nextLevel") as! MSButtonNode2
        button.link = childNodeWithName("foo") as! SKSpriteNode
        button.selectedHandler = {
            let flapSFX = SKAction.playSoundFileNamed("button", waitForCompletion: false)
            self.runAction(flapSFX)
            let skView = self.view as SKView!
            let scene = GameScene(fileNamed:"GameScene") as GameScene!
            scene.scaleMode = .AspectFill
            skView.presentScene(scene, transition: SKTransition.crossFadeWithDuration(1))
        }
    }
}