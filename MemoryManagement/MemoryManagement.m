//
//  MemoryManagement.m
//  MemoryManagement
//
//  Created by Andyy Hope on 5/01/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

#import "MemoryManagement.h"
#import "Dinosaur.h"

@implementation MemoryManagement


- (instancetype)init {
    self = [super init];
    if (self) {
        [self showExamples];
    }
    return self;
}

#pragma mark - Examples Menu
/*  Pro tip:
    Only uncomment one at a time  */

- (void)showExamples {
    
//// Basic Stuff
    
    
//    [self allocExample];
    
//    [self retainExample];
    
//    [self copyExample];
    
//    [self releaseExample];
    
//    [self autoreleaseExample];
    
    
//// Examples of unsafe memory management
    
//    [self danglingPointerExample];
    
//    [self memoryLeakExample];
}


#pragma mark - Alloc Example

- (void)allocExample {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    [dinosaur doDinosaurStuff];
    // retainCount, dinosaur: 1
}


#pragma mark - Retain Example
/*  Pro tip:
    To see various scenarios of this, look at the Dinosaur.m file  */

- (void)retainExample {
    NSMutableArray *teeth = [[NSMutableArray alloc] init];
    [teeth addObject:@"sharp tooth"];
    // retainCount, teeth: 1
    
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount, dinosaur: 1
    
    [dinosaur setTeeth:teeth];
    
    [teeth release];
    // retainCount, teeth: 0
    
    [dinosaur countTeeth];
    // crash
}


#pragma mark - Copy Example

- (void)copyExample {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount, dinosaur: 1
    
    [dinosaur retain];
    [dinosaur retain];
    [dinosaur retain];
    // retainCount, dinosaur: 4
    
    [dinosaur printRetainCount];
    
    Dinosaur *tRex = [dinosaur copy];
    // retainCount, tRex: 1
    
    [tRex printRetainCount];
    
    [dinosaur release];
    [dinosaur release];
    [dinosaur release];
    [dinosaur release];
    // retainCount, dinosaur: 0
    
    [tRex release];
    // retainCount, tRex: 0
}


#pragma mark -  Release Example

- (void)releaseExample {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount: 1
    
    [dinosaur release];
    // retainCount: 0
}


#pragma mark - Auto Release Example

- (void)autoreleaseExample {
    Dinosaur *dinosaur = [self getDinosaur];
    // retainCount: 1
    
    [dinosaur release];
    // retainCount: 0
}

- (Dinosaur *)getDinosaur {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount: 1
    
    [dinosaur autorelease];
    // retainCount: 1
    
    return dinosaur;
    // retainCount: 1
}


#pragma mark - Auto Release Pool Example

- (void)autoreleasePoolExample {
    for (int i = 0; i < 10; i++) {
        Dinosaur *dinosaur = [[Dinosaur alloc] init];
        [dinosaur autorelease];
    }
}


#pragma mark - Unsafe Memory Management Examples

- (void)danglingPointerExample {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount: 1
    
    [dinosaur doDinosaurStuff];
    
    [dinosaur release];
    // retainCount: 0
    
    
    // dinosaur is now a dangling pointer,
    // calling methods on it may or may not crash the application

    
    [dinosaur doDinosaurStuff];
    // might crash here
    
    [dinosaur doDinosaurStuff];
    // might crash here
}

- (void)memoryLeakExample {
    Dinosaur *dinosaur = [[Dinosaur alloc] init];
    // retainCount: 1
    
    
    // imagine theres a bunch of code in between each retain call
    
    
    [dinosaur retain];
    [dinosaur retain];
    [dinosaur retain];
    [dinosaur retain];
    [dinosaur retain];
    [dinosaur retain];
    // retainCount: 7
    
    
    // because we didn't call release 7 times to bring it's retain count to 0,
    // this memory will never be freed up.
    // multiply this type of bad behaviour enough times and it will eventually
    // cause the application to run out of memory and ultimately crash
    
}

@end
