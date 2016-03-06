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
        layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 100);
        
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
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1];
    
    [self.view addSubview:self.collectionView];
    
    [self setupConstraints];
}


#pragma mark Helpers

- (void)setupConstraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_collectionView);
    
    // Pin coll view
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:nil views:views]];
    
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
    
    GVPost *post = [self.posts objectAtIndex:indexPath.row];
    cell.headerView.titleLabel.text = post.username;
    cell.headerView.imageView.image = [UIImage imageNamed:post.profileImageName];
    cell.headerView.infoSubtitleLabel.text = @"Loops";
    cell.headerView.infoTitleLabel.text = post.loopCount;
    cell.headerView.subtitleLabel.text = post.postDate;
    cell.videoPlayer.videoURL = post.videoURL;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray *visibleCells = [self.collectionView visibleCells];
    
    GVPostCollectionViewCell *cellToActivate;
    GVPostCollectionViewCell *cellToDeactivate;
    
    for (UICollectionViewCell *cell in visibleCells) {
        if (!cellToActivate) {
            cellToActivate = (GVPostCollectionViewCell *)cell;
        } else {
            // cellToActive is always the top most cell
            GVPostCollectionViewCell *cell1 = cellToActivate;
            NSIndexPath *cell1_indexPath = [self.collectionView indexPathForCell:cell1];
            CGRect cell1_frame = [self.collectionView layoutAttributesForItemAtIndexPath:cell1_indexPath].frame;

            GVPostCollectionViewCell *cell2 = cell;
            NSIndexPath *cell2_indexPath = [self.collectionView indexPathForCell:cell2];
            CGRect cell2_frame = [self.collectionView layoutAttributesForItemAtIndexPath:cell2_indexPath].frame;
            
            // Cell frames in controller frames
            CGRect cell1_frameInSuperview = [self.collectionView convertRect:cell1_frame toView:[self.collectionView superview]];
            CGRect cell2_frameInSuperview = [self.collectionView convertRect:cell2_frame toView:[self.collectionView superview]];

            // Calculate which cell has the most real estate on screen
            CGFloat cell1_visibleAmount = cell1_frameInSuperview.size.height - ABS(cell1_frameInSuperview.origin.y);
            CGFloat cell2_visibleAmount = cell2_frameInSuperview.size.height - ABS(cell2_frameInSuperview.origin.y);
            
            if (cell1_visibleAmount > cell2_visibleAmount) {
                cellToActivate = cell1;
                cellToDeactivate = cell2;
            } else {
                cellToActivate = cell2;
                cellToDeactivate = cell1;
            }
        }
    }
    
    if (cellToActivate && cellToActivate.videoPlayer.status != GVVideoPlayerPlaying) {
        [cellToActivate.videoPlayer play];
    }
    [cellToDeactivate.videoPlayer pause];
}

@end
