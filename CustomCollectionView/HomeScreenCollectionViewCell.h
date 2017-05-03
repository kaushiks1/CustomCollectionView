//
//  HomeScreenCollectionViewCell.h
//  CustomCollectionView
//
//  Created by SILICON on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface HomeScreenCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageViewItem;
@property (weak, nonatomic) IBOutlet UILabel *labelItemlName;
@property (weak, nonatomic) IBOutlet UIView *ViewMain;

- (void)cellSetUpData:(id)CellData;

@end
