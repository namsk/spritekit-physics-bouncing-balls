//
//  BouncingScene.m
//  Bouncing
//
//  Created by Seung Kyun Nam on 13. 7. 24..
//  Copyright (c) 2013년 Seung Kyun Nam. All rights reserved.
//

#import "BouncingScene.h"

@implementation BouncingScene
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        [self addChild:[self createFloor]];
        [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
    }
    return self;
}

- (SKSpriteNode *)createFloor {
    SKSpriteNode *floor = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(self.frame.size.width, 20)];
    [floor setAnchorPoint:CGPointMake(0, 0)];
    [floor setName:@"floor"];
    [floor setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:floor.frame]];
    floor.physicsBody.dynamic = NO;
    
    return floor;
}

- (SKShapeNode *)createBall:(CGPoint)location {
    SKShapeNode *ball = [SKShapeNode node];
    
    //  Draw ball and set it to SKShapeNode
    CGPathRef path = CGPathCreateWithEllipseInRect((CGRect){{-20, -20}, {40, 40}}, NULL);
    [ball setPath:path];
    CGPathRelease(path);
    
    [ball setPosition:location];
    [ball setName:@"ball"];
    
    //  Set up physics body of ball object.
    [ball setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:20.0]];
    ball.physicsBody.dynamic = YES;
    ball.physicsBody.restitution = 0.7;
//  Important properties of PhysicsBody
//      ball.physicsBody.mass = 0;    //  mass of physics object
//      ball.physicsBody.density = 0;     //  density of physics object: defaul 1.0
//      ball.physicsBody.friction = 0;    //  friction of physics object: 0.0 ~ 1.0
//      ball.physicsBody.restitution = 0; //  restitution(bounciness) of physics object: 0.0 ~ 1.0 : default 0.2
    
    return ball;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self addChild:[self createBall:location]];
    }
}

- (void)didSimulatePhysics {
    [self enumerateChildNodesWithName:@"ball" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0) {
            [node removeFromParent];
        }
    }];
}
@end
