//
//  Dinosaur.h
//  MemoryManagement
//
//  Created by Andyy Hope on 5/01/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dinosaur : NSObject

- (void)printRetainCount;
- (void)doDinosaurStuff;

- (NSMutableArray *)teeth;
- (void)setTeeth:(NSMutableArray *)teeth;
- (void)countTeeth;
@end
