//
//  ViewController.m
//  FunnyFace
//
//  Created by iOS11 on 3/31/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
UIImageView* funnyFaceView;
@implementation ViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)]];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    funnyFaceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"funnyFaceNormal"]];
    [funnyFaceView setFrame: CGRectMake(70, 100, 200, 200)];
    [self.view addSubview:funnyFaceView];
    //[self.view addGestureRecognizer:[[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tapHandle:(id)sender{
    UITapGestureRecognizer* tapGesture = (UITapGestureRecognizer*)sender;
    CGPoint point = [tapGesture locationInView:self.view];
    NSLog(@"%f - %f", point.x, point.y);
    UIImageView* bullet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bullet"]];
    [bullet setFrame: CGRectMake(0,0,30,30)];
    bullet.center = CGPointMake(-70, -70);
    [self.view addSubview:bullet];
    [UIView animateWithDuration:0.1
                     animations:^{
                         bullet.center = bullet.center = CGPointMake(point.x, point.y);
                     }
                     completion:^(BOOL finish){
                         bullet.image = [UIImage imageNamed:@"crack"] ;
                         float distance = (bullet.center.x - 170)*(bullet.center.x - 170) + (bullet.center.y - 193)*(bullet.center.y - 193);
                         if (distance < 6000) {
                             [funnyFaceView setImage:[UIImage imageNamed:@"funnyFaceTapped"]];
                         }
                     }];
}
- (IBAction)reset:(id)sender {
    for ( id object in self.view.subviews) {
        if (![object isKindOfClass:[UIButton class]]) {
            [object removeFromSuperview];
        }
    }
    [funnyFaceView setImage:[UIImage imageNamed:@"funnyFaceNormal"]];
    [self.view addSubview:funnyFaceView];
}

@end
