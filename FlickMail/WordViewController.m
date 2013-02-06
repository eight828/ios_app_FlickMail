//
//  WordViewController.m
//  FlickMail
//
//  Created by Koki-Teraoka on 6/17/12.
//
//

#import "WordViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation WordViewController

@synthesize number_;
@synthesize word_;

//+ (WordViewController*)wordViewControllerWithNumber:(NSInteger)number
//{
//    WordViewController* wordViewController = [[WordViewController alloc] init];
//    wordViewController.number_ = number;
//    return wordViewController;
//}

//- (id)init
//{
//	word_ = [[NSString alloc] init];
//	
//	return 0;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UILabel* label = [[UILabel alloc] init];
	UIImage* labelBackgroundImage = [UIImage imageNamed:@"paper.png"];
    label.frame = self.view.bounds;
	label.layer.cornerRadius = 8;
//    label.backgroundColor = (self.number_ % 2) ?
//                            [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0] :
//                            [UIColor colorWithRed:0.7 green:0.1 blue:0.4 alpha:1.0];
//	label.backgroundColor = [UIColor colorWithPatternImage:labelBackgroundImage];
	label.backgroundColor = [UIColor whiteColor];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//	label.backgroundColor = [UIColor underPageBackgroundColor];
//	label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:20];
    //label.text = [NSString stringWithFormat:@"%d", self.number];
    label.text = word_;
	[self.view addSubview:label];
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
