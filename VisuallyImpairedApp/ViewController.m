//
//  ViewController.m
//  VisuallyImpairedApp
//
//  Created by Rahul Shekhar on 5/1/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) CMMotionManager  *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.motionManager = [[CMMotionManager alloc]  init];
    self.motionManager.deviceMotionUpdateInterval = 0.1;
    self.queue         = [[NSOperationQueue alloc] init];
    [self.motionManager startDeviceMotionUpdatesToQueue:self.queue withHandler:^(CMDeviceMotion *motion, NSError *error) {
        [self performSelectorOnMainThread:@selector(updateData) withObject:nil waitUntilDone:NO];
        NSLog(@"%@", motion);
    }];
}

-(void)updateData{
    NSLog(@"hsjsk");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
