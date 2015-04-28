//
//  MainViewController.m
//  PlayWithTableManualy
//
//  Created by Kate Polyakova on 4/26/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "MainViewController.h"
#import "ImageViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSArray *data;
@property(nonatomic, strong) NSArray *images;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | 
            UIViewAutoresizingFlexibleWidth | 
            UIViewAutoresizingFlexibleRightMargin | 
            UIViewAutoresizingFlexibleTopMargin | 
            UIViewAutoresizingFlexibleHeight | 
            UIViewAutoresizingFlexibleBottomMargin;

    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.data = @[@"Астра", @"Роза", @"Гладиолус", @"Тюльпан", @"Крокус", @"Хризантема"];
    self.images = @[@"astra.jpg",@"rose.png", @"gladi.jpg", @"tulip.jpg", @"krokus.jpg", @"hriza.jpg"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    cell.textLabel.text = self.data[(NSUInteger)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //выводим в лог имя строки, на которую нажали
    NSLog(@"Tapped row with title: %@", self.data[(NSUInteger)indexPath.row]);

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ImageViewController *imageViewController = [[ImageViewController alloc] init];

    NSString *imageFileName = self.images[(NSUInteger)indexPath.row];
    imageViewController.imageName = imageFileName;

    [self presentViewController:imageViewController animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
