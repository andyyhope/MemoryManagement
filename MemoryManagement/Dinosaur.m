//
//  Dinosaur.m
//  MemoryManagement
//
//  Created by Andyy Hope on 5/01/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

#import "Dinosaur.h"

@implementation Dinosaur {
    NSMutableArray *_teeth;
}

- (NSMutableArray *)teeth {
    return _teeth;
}


#pragma mark - Retain Examples

//- (void)setTeeth:(NSMutableArray *)teeth {
//    _teeth = teeth;
//}

//- (void)setTeeth:(NSMutableArray *)teeth {
//    _teeth = [teeth retain];
//}

- (void)setTeeth:(NSMutableArray *)teeth {
    
    // pointer comparison check
    // we dont need to perform the code below if the new and old object are the same

    if (_teeth == teeth) {
        return;
    }
    
    // create a temporary pointer to the old value
    NSMutableArray *oldTeethValue = _teeth;
    
    // assign the new value
    _teeth = [teeth retain];
    
    // release the old value
    [oldTeethValue release];
}

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"Dinosaur: alloc");
    }
    return self;
}

- (void)printRetainCount {
    NSLog(@"Dinosaur: retainCount: %@", @(self.retainCount));
}

- (void)doDinosaurStuff {
    NSLog(@"Dinosaur: Rarrrrrr!");
}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    return copy;
}


- (void)countTeeth {
    NSLog(@"Dinosaur: Teeth:%@", @([[self teeth] count]));
}
@end
