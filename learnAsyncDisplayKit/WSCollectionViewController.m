//
//  WSCollectionViewController.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/27.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSCollectionViewController.h"
#import "WSCollectionViewCell.h"

@interface WSCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *sourceArr;
@end

@implementation WSCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    [self.collectionView registerClass:[WSCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    NSInteger i = 1 % 20;
    NSLog(@"%ld",i);
    [self configSourceArr];
    // Do any additional setup after loading the view.
}

- (void)configSourceArr {
    
    self.sourceArr = [NSMutableArray array];
    for (int i = 0; i < 20000; i ++) {
        NSInteger j = i % 20;
        NSString *imageName = [NSString stringWithFormat:@"%ld",j];
        [self.sourceArr addObject:[UIImage imageNamed:imageName]];
    }
    [self.collectionView reloadData];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.sourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.myImage = self.sourceArr[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


#pragma mark <UICollectionViewDelegate>

#pragma mark -
#pragma mark - dealloc
- (void)dealloc{
    NSLog(@"normal collection dealloc");
}


@end
