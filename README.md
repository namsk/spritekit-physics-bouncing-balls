## SpriteKit Physics Example: Bouncing Balls

A demo for using physics system of SpriteKit.

## Simulation Tips:

If you want to stay the ball inside of the scene, unremark the third line in the `initWithSize` method of the BouncingScene.m as follows:

    [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
    
Change the properties on the physics body of the ball and then watch the differences of moving.

##Requirements:

Requirements:
-------------
* xcode 5 developer preview 4
* iOS 7 SDK Beta 4
