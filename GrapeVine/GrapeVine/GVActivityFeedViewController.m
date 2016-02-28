//
//  GVActivityFeedViewController.m
//  GrapeVine
//
//  Created by Dru Lang on 2/28/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

// Service
#import "GVBackendService.h"

// Views
#import "GVPostCollectionViewCell.h"

#import "GVActivityFeedViewController.h"


//_______________________________________________________________________________________________________________
// Class Interface

@interface GVActivityFeedViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic)UICollectionView *collectionView;

@end

//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVActivityFeedViewController

#pragma mark Properties

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[GVPostCollectionViewCell class] forCellWithReuseIdentifier:GVPostCollectionViewCellIdentifier];
    }
    return _collectionView;
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark Helpers

- (void)setupConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_collectionView);
    
    // Pin coll view
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:nil views:views]];
    
}

#pragma mark UICollectionViewDelegate/UICollectionViewDataSource

@end
