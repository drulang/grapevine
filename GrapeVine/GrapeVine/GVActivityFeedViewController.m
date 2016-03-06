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
@property (nonatomic)NSArray <GVPost *> *posts;

@end

//_______________________________________________________________________________________________________________
// Class Implementation

@implementation GVActivityFeedViewController

#pragma mark Properties

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 60);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[GVPostCollectionViewCell class] forCellWithReuseIdentifier:GVPostCollectionViewCellIdentifier];
    }
    return _collectionView;
}

- (NSArray <GVPost *> *)posts {
    if (!_posts) {
        _posts = [[GVBackendService sharedService] activityFeed];
    }
    return _posts;
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    [self setupConstraints];
}

#pragma mark Helpers

- (void)setupConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_collectionView);
    
    // Pin coll view
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_collectionView]|" options:0 metrics:nil views:views]];
    
}

#pragma mark UICollectionViewDelegate/UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GVPostCollectionViewCell *cell = (GVPostCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:GVPostCollectionViewCellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

@end
