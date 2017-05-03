//
//  HomeScreenViewController.m
//  CustomCollectionView
//
//  Created by SILICON on 03/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "HomeScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%f",WD);
    NSLog(@"%f",HT);
    
    [super viewDidLoad];    
    
    NSMutableArray *arrayCGPDashboardTableViewData = [[NSMutableArray alloc]init];
    arrayCGPDashboardTableViewData = (NSMutableArray *)@[@"Plan Detail",@"Accumalated Gold",@"Payments / Installments",@"Pay Monthly EMI / TOPUP"];
    
    NSMutableArray *arrayMyProfileTableViewData = [[NSMutableArray alloc]init];
    arrayMyProfileTableViewData = (NSMutableArray *)@[@"Personal Detail",@"Contact Detail",@"Nomination Detail",@"Change Password"];
    
    NSMutableArray *arrayBecomeaReferalTableViewData = [[NSMutableArray alloc]init];
    arrayBecomeaReferalTableViewData = (NSMutableArray *)@[@"What is referral program",@"Reward Point Statement"];
    
    
    NSMutableArray *arrayShoppingTableViewData = [[NSMutableArray alloc]init];
    arrayShoppingTableViewData = (NSMutableArray *)@[@"Shopping"];
    
    NSMutableArray *arrayAboutTableViewData = [[NSMutableArray alloc]init];
    arrayAboutTableViewData = (NSMutableArray *)@[@"Company",@"Brand Cherish Gold",@"FAQ",@"Terms & Condition",@"Policies"];
    
    
    NSMutableArray *arrayRelationshipManagerTableViewData = [[NSMutableArray alloc]init];
    arrayRelationshipManagerTableViewData = (NSMutableArray *)@[@"RM Details"];
    
    
    NSMutableArray *arrayContactusTableViewData = [[NSMutableArray alloc]init];
    arrayContactusTableViewData = (NSMutableArray *)@[@"Contact Us",@"Call us!",@"Send Query",@"Help us improve"];
    
    
    NSMutableArray *arraySocialMediaTableViewData = [[NSMutableArray alloc]init];
    arraySocialMediaTableViewData = (NSMutableArray *)@[@"Facebook",@"Twitter"];
    
    
    NSMutableArray *arrayProposenewReferanceTableViewData = [[NSMutableArray alloc]init];
    arrayProposenewReferanceTableViewData = (NSMutableArray *)@[@"Propose Referance",@"Status of Submitted Referances"];
   
    
    
    
    
    
    self.arrayCollectionViewData = (NSMutableArray *)@[@{@"Image": @"a1", @"Name":@"CGP Dashboard", @"Title":@"CGP Dashboard", @"TableData":arrayCGPDashboardTableViewData},
                                                       @{@"Image": @"b2", @"Name":@"My Profile", @"Title":@"My Profile", @"TableData":arrayMyProfileTableViewData},
                                                       @{@"Image": @"c3", @"Name":@"Become a Referal", @"Title":@"Become a Referal", @"TableData":arrayBecomeaReferalTableViewData},
                                                       @{@"Image": @"d4", @"Name":@"Shopping", @"Title":@"Shopping", @"TableData":arrayShoppingTableViewData},
                                                       @{@"Image": @"e5", @"Name":@"About", @"Title":@"About", @"TableData":arrayAboutTableViewData},
                                                       @{@"Image": @"f6", @"Name":@"Relationship Manager", @"Title":@"Relationship Manager", @"TableData":arrayRelationshipManagerTableViewData},
                                                       @{@"Image": @"g7", @"Name":@"Contact us", @"Title":@"Contact Us", @"TableData":arrayContactusTableViewData},
                                                       @{@"Image": @"h8", @"Name":@"Social Media", @"Title":@"Social Media", @"TableData":arraySocialMediaTableViewData},
                                                       @{@"Image": @"i9", @"Name":@"Propose new Referance", @"Title":@"Propose New Referance", @"TableData":arrayProposenewReferanceTableViewData},];
    
    NSLog(@"%@",self.arrayCollectionViewData);
    
    /*
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
//    (cellWidth, cellHeight)
    flow.itemSize = CGSizeMake(10, 10);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    */
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [_viewPopUpBelowTable addGestureRecognizer:tapGestureRecognizer];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - CollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arrayCollectionViewData count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *stringStaticIdentifier = @"HomeScreenCollectionViewCell";
    HomeScreenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:stringStaticIdentifier forIndexPath:indexPath];
    [cell cellSetUpData:[self.arrayCollectionViewData objectAtIndex:indexPath.row]];
    [[cell contentView] setFrame:[cell bounds]];
    [[cell contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    _viewPopUpBelowTable.hidden = NO;
    _tableViewPopUp.hidden = NO;
    
    _arrayTableViewData = [[_arrayCollectionViewData objectAtIndex:indexPath.row] valueForKey:@"TableData"];
    _stringTableViewTitle = [[_arrayCollectionViewData objectAtIndex:indexPath.row] valueForKey:@"Title"];
    NSLog(@"%@",_stringTableViewTitle);
    
     _tableViewPopUp.frame = CGRectMake(self.view.center.x - ((WD/1.2)/2), self.view.center.y - (((HT/15.0*(_arrayTableViewData.count)) + HT/15.0)/2), WD/1.2, (HT/15.0*(_arrayTableViewData.count)) + HT/15.0);
    
    
//    _tableViewPopUp.translatesAutoresizingMaskIntoConstraints = YES;
//    [self.view addSubview:_tableViewPopUp];
//    // Width
//    [_tableViewPopUp addConstraint:[NSLayoutConstraint constraintWithItem:_tableViewPopUp attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:WD/1.2]];
//    // Height
//    [_tableViewPopUp addConstraint:[NSLayoutConstraint constraintWithItem:_tableViewPopUp attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:((HT/15.0*(_arrayTableViewData.count)) + HT/15.0)]];
//        // X
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableViewPopUp attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
//    // Y
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableViewPopUp attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
//    [self.view addSubview:_tableViewPopUp];
    

    
    [_tableViewPopUp reloadData];
}


#pragma mark - CollectionView FlowLayout
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%f",WD);
    NSLog(@"%f",HT);
    return CGSizeMake(WD/3.5f, HT/4.1f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    Space Between cell Vertically
    return WD/25;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    Space Between cell Horizontally
    return HT/33;
}


// Layout: Set Edges
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0, WD/37.5, 0, WD/37.5);
}



#pragma mark - View Popup
#pragma mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayTableViewData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellTableView"];
    
    cell.textLabel.text = [_arrayTableViewData objectAtIndex:indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _stringTableViewTitle;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HT/15.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HT/15.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
}


-(void)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
}


@end
