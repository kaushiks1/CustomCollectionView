//
//  HomeScreenViewController.h
//  CustomCollectionView
//
//  Created by SILICON on 03/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreenCollectionViewCell.h"
#import "Constant.h"

@interface HomeScreenViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *arrayCollectionViewData;
@property (strong, nonatomic) NSMutableArray *arrayTableViewData;
@property (strong, nonatomic) NSString *stringTableViewTitle;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewHomeScreen;

@property (weak, nonatomic) IBOutlet UITableView *tableViewPopUp;
@property (weak, nonatomic) IBOutlet UIView *viewPopUpBelowTable;


@end
