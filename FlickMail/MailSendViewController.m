//
//  MailSendViewController.m
//  FlickMail
//
//  Created by 幸紀 寺岡 on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MailSendViewController.h"

@implementation MailSendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    
    [mailPicker setMessageBody:@"test Message" isHTML:NO];
    [mailPicker setSubject:@"test Subject"];
    [mailPicker setToRecipients:[NSArray arrayWithObjects:@"g.stranger828@gmail.com", nil]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
