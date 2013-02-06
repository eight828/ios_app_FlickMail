//
//  AddNewWordViewController.m
//  FlickMail
//
//  Created by Koki-Teraoka on 7/21/24 Heisei.
//
//

#import "AddNewWordViewController.h"

@implementation AddNewWordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	/* ---------- closeWindowButton ---------- */
    UIFont* closeWindowButtonFont = [UIFont fontWithName:@"Verdana" size:40];
    UIButton* closeWindowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeWindowButton setTitle:@"close" forState:UIControlStateNormal];
    [closeWindowButton sizeToFit];
    closeWindowButton.titleLabel.font = closeWindowButtonFont;
    closeWindowButton.frame = CGRectMake(0, 0, 150, 50);
	closeWindowButton.center = CGPointMake(160, 70);
    [closeWindowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    closeWindowButton.showsTouchWhenHighlighted = YES;
    closeWindowButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.7 blue:0.95 alpha:1.0];
    [closeWindowButton addTarget:self
					  action:@selector(closeWindowButtonDidPush)
			forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeWindowButton];

	inputNewWordField_ = [[UITextField alloc] init];
	inputNewWordField_.frame = CGRectMake(0, 0, 300, 30);
	inputNewWordField_.center = CGPointMake(160, 130);
	inputNewWordField_.borderStyle = UITextBorderStyleRoundedRect;
	[self.view addSubview:inputNewWordField_];
	
}

- (void)closeWindowButtonDidPush
{
	NSString* word_x = [[NSString alloc] init];
	word_x = inputNewWordField_.text;
	[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
