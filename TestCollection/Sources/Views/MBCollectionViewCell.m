//
// Created by Jan on 11/05/14.
// Copyright (c) 2014 Tequila Apps. All rights reserved.
//

#import "MBCollectionViewCell.h"

@implementation MBCollectionViewCell
{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 0.5f;
    }

    return self;
}

@end