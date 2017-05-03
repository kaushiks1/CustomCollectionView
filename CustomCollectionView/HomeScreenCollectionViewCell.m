//
//  HomeScreenCollectionViewCell.m
//  CustomCollectionView
//
//  Created by SILICON on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "HomeScreenCollectionViewCell.h"

@implementation HomeScreenCollectionViewCell



- (void)cellSetUpData:(id)CellData
{
    NSLog(@"%@",CellData);
    
    [_ViewMain.layer setCornerRadius:20.0f];
    _ViewMain.layer.borderColor = [UIColor grayColor].CGColor;
    _ViewMain.layer.borderWidth = 2.0f;
    [_ViewMain.layer setMasksToBounds:YES];
    
    self.imageViewItem.image = [UIImage imageNamed:[CellData valueForKey:@"Image"]];
    self.labelItemlName.text = [CellData valueForKey:@"Name"];
    
}


@end
