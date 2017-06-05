//
//  ViewController.m
//  MPUserDefaults
//
//  Created by Liuguiliang on 2017/6/5.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "ViewController.h"
#import "TestDemo.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameT;
@property (weak, nonatomic) IBOutlet UILabel *userNameL;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.userNameL.text = [TestDemo standardUserDefaults].userName;

}

- (IBAction)settingUserName:(id)sender {
    [TestDemo standardUserDefaults].userName = self.userNameT.text;
    self.userNameL.text = [TestDemo standardUserDefaults].userName;
    
}

@end
