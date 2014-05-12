//
// Created by Jan on 11/05/14.
// Copyright (c) 2014 Tequila Apps. All rights reserved.
//

#import "MBCollectionViewCell.h"

@interface MBCollectionViewCell()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, assign, readwrite) BOOL didUpdateConstraints;

@end

@implementation MBCollectionViewCell
{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        self.titleLabel = [[UILabel alloc] init];

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.titleLabel];

        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 0.5f;
    }

    return self;
}

- (void)updateConstraints
{
    [super updateConstraints];
    if( self.didUpdateConstraints ) {
        return;
    }



    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
    self.didUpdateConstraints = YES;
}

@end