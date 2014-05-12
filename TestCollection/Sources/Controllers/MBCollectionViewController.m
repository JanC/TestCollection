//
//  MBCollectionViewController.m
//  TestCollection
//
//  Created by Jan on 11/05/14.
//  Copyright (c) 2014 Tequila Apps. All rights reserved.
//

#import "MBCollectionViewController.h"
#import "MBCollectionViewCell.h"

#pragma mark - Constants

NSString * const MBCollectionViewControllerCellId = @"MBCollectionViewControllerCellId";

@interface MBCollectionViewController () <UICollectionViewDataSource>
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, strong, readwrite) UICollectionViewFlowLayout *flowLayout;
@end

@implementation MBCollectionViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor blueColor] ;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[MBCollectionViewCell class] forCellWithReuseIdentifier:MBCollectionViewControllerCellId];

    [self.view addSubview:self.collectionView];

    //
    // Auto layout
    //

    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    id topLayoutGuide = self.topLayoutGuide;
    NSDictionary *views = NSDictionaryOfVariableBindings(_collectionView,topLayoutGuide);

    NSDictionary *metrics = @{@"collectionViewHeight" : @100 };

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide][_collectionView(collectionViewHeight)]" options:0 metrics:metrics views:views]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.flowLayout.itemSize = [self sizeForFlowLayoutItem];
    [self.collectionView reloadData];
}


#pragma mark
#pragma mark - Protocols

#pragma mark
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MBCollectionViewControllerCellId forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    [cell.titleLabel sizeToFit];

    [cell setNeedsUpdateConstraints];

    return cell;
}

#pragma mark
#pragma mark - Private

-(CGSize)sizeForFlowLayoutItem
{
    // 7 columns, two rows
    CGSize size = CGSizeMake(self.collectionView.bounds.size.width / 7.0, self.collectionView.bounds.size.height / 2.0);

    NSLog(@"size %@", NSStringFromCGSize(size));
    return size;
}

@end
