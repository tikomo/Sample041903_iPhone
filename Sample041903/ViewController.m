//
//  ViewController.m
//  Sample041903
//
//  Created by tikomo on 2014/04/19.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView1;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // case1)
    [_tableView1 setDelegate:self];
    [_tableView1 setDataSource:self];
    
    // case2)
    // _tableView1.delegate = self;
    // _tableView1.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
// セルの内容を表示する
//
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *sampleIdentifier = @"Cell";
    
    NSArray *nutrition01 = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e", nil];
    NSArray *nutrition02 = [[NSArray alloc] initWithObjects:@"a2",@"b2",@"c2",@"d2",@"e2", nil];
    
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:sampleIdentifier];
    
    if (tvCell == nil) {
        
        //tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sampleIdentifier];
        // tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:sampleIdentifier];
        // tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:sampleIdentifier];
        tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:sampleIdentifier];
    }
    
    
    if (indexPath.section == 0){
        tvCell.textLabel.text = [nutrition01 objectAtIndex:indexPath.row];
        tvCell.detailTextLabel.text = [nutrition02 objectAtIndex:indexPath.row];

    } else if (indexPath.section == 1) {
        tvCell.textLabel.text = [nutrition02 objectAtIndex:indexPath.row];
        tvCell.detailTextLabel.text = [nutrition01 objectAtIndex:indexPath.row];
    }
    
    
    return tvCell;
     
}

//
// 行数を返す
//
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *containerView = [[UIView alloc] init];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 10, 70, 20);
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    
    [containerView addSubview:button1];
    return containerView;
    
 
}
 */

//
// テーブルビューのセクションにタイトルを付ける
//
/*
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch(section) {
        case 0 :
            return @"Title - 0";
            break;
        case 1:
            return @"Title - 1";
            break;
        default:
            return @"Title - default";
            break;
    }
    
}
*/

//
// セクション数を返す
//
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


@end
