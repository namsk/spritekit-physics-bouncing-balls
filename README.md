## SpriteKit Physics Example: Bouncing Balls

A demo for using physics system of SpriteKit.

## Simulation Tips:

If you want to make the balls stay inside of the scene, unremark the third line in the `initWithSize` method of the BouncingScene.m as follows:

    [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
    
Change the properties on the physics body of the ball and then watch the differences of moving.

##Requirements:

* Xcode 5 
* iOS 7 SDK 
