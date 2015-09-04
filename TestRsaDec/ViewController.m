//
//  ViewController.m
//  TestRsaDec
//
//  Created by zeng hui on 15/8/31.
//  Copyright (c) 2015年 zeng hui. All rights reserved.
//

#import "ViewController.h"
#import <Security/Security.h>
#import "AESCrypt.h"
#import "JSRSA.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *message = @"top secret message";
    NSString *password = @"p4ssw0rd";
    
    // Encrypting
    NSString *encryptedData = [AESCrypt encrypt:message password:password];
    
    // Decrypting
    NSString *mge = [AESCrypt decrypt:encryptedData password:password];
    
    
    [JSRSA sharedInstance].publicKey = @"public_key.pem";
    [JSRSA sharedInstance].privateKey = @"private_key.pem";
    
    NSString *plainText = [[JSRSA sharedInstance] publicEncrypt:message];
    
    NSLog(@"pt: %@", plainText);
    
    NSString *dstr = @"Q27QLQwyNMXy0POr4SWf3ElFBS9wW/iZ7+i4w213qmJ3GpZBz8xoP50xRy+9eHNUxAtntuhIjxq0bI2izFq0TA==";
    plainText = [[JSRSA sharedInstance] privateDecrypt:dstr];
    NSLog(@"dstr: %@", plainText);

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
