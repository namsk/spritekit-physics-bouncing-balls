## SpriteKit Physics Example: Bouncing Balls

A demo for using physics system of SpriteKit.

* There is a [swift port version](https://github.com/namsk/spritekit-swift-physics-bouncing-balls) of this project available.

## Simulation Tips:

If you want to make the balls stay inside of the scene, unremark the third line in the `initWithSize` method of the BouncingScene.m as follows:

    [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
    
Change the properties on the physics body of the ball and then watch the differences of moving.

##Requirements:

* Xcode 5 or higher
* iOS 7 SDK or higher
