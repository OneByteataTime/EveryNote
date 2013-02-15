//
//  SJENViewController.h
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJENViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webViewer;

@end
