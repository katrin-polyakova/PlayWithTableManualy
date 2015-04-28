//
//  ImageViewController.m
//  PlayWithTableManualy
//
//  Created by Kate Polyakova on 4/26/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
            UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleRightMargin |
            UIViewAutoresizingFlexibleTopMargin |
            UIViewAutoresizingFlexibleHeight |
            UIViewAutoresizingFlexibleBottomMargin;

    [self.view addSubview:self.imageView];

    self.imageView.backgroundColor = [UIColor colorWithRed:1 green:0.56f blue:1 alpha:1];

    UIGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnView:)];
    [self.view addGestureRecognizer:gestureRecognizer];

    self.imageView.image = [UIImage imageNamed:self.imageName];

    self.imageView.contentMode = UIViewContentModeScaleAspectFill;

}

- (IBAction)didTapOnView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
