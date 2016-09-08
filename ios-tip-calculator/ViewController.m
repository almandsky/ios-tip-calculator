//
//  ViewController.m
//  ios-tip-calculator
//
//  Created by Sky Chen on 9/8/16.
//  Copyright © 2016 Sky Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextValue;
@property (weak, nonatomic) IBOutlet UILabel *tipLable;
@property (weak, nonatomic) IBOutlet UILabel *totalLable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";
    // self.tipLable.text = @"$5.00";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // get the bill amount
    float billAmount = [self.billTextValue.text floatValue];
    // compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.18), @(0.2)];
    float tipAmont = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmont;
    // update UI
    self.tipLable.text = [NSString stringWithFormat:@"$%0.2f", tipAmont];
    self.totalLable.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

}

@end
