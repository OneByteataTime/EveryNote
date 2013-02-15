//
//  SJENViewController.m
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import "SJENViewController.h"

@interface SJENViewController ()

@end

@implementation SJENViewController
@synthesize urlTextField;
@synthesize webViewer;

- (IBAction)goButtonClick:(id)sender {
    // Hide keybard
    [urlTextField resignFirstResponder];
    
    NSURL *url = [[NSURL alloc] initWithString:urlTextField.text];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webViewer loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    urlTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self goButtonClick:textField];
    return YES;
}
@end
