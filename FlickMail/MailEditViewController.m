//
//  MailEditViewController.m
//  FlickMail
//
//  Created by 幸紀 寺岡 on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.

#import "MailEditViewController.h"
#import <QuartzCore/QuartzCore.h>

#define SPACE 5
#define TOOLBAR 0

@implementation MailEditViewController

- (void)viewDidLoad
{
    static const NSInteger commonWidth = 180; // width of scrollView
	static const NSInteger scrollWordHeight = 100; // height of scrollView
    static const NSInteger titleHeight = 60; // height of UINavigationbar
    static const NSInteger wordNumberOfPages = 2;
    static const NSInteger scrollView1_x = 160-(commonWidth/2); // x
    static const NSInteger scrollView1_y = titleHeight + SPACE; // y
    static const NSInteger scrollView2_x = 160-(commonWidth/2); // x
    static const NSInteger scrollView2_y = scrollView1_y + scrollWordHeight + SPACE; // y
	static const NSInteger scrollView3_x = 160-(commonWidth/2); // x
    static const NSInteger scrollView3_y = scrollView2_y + scrollWordHeight + SPACE; // y
	static const NSInteger mailText_y = scrollView3_y + scrollWordHeight + SPACE*3;
	static const NSInteger mailTextHeight = 50;
	static const NSInteger button_y = mailText_y + mailTextHeight + SPACE*3;
	
    [super viewDidLoad];
    
	CGRect frame = self.view.bounds;
	
	// baseScrollView_の作成
	baseScrollView_ = [[UIScrollView alloc] initWithFrame:frame];
	[self.view addSubview:baseScrollView_];

//	UIImage* mainBackgroundImage = [UIImage imageNamed:@"paper.png"];
	self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:1.0];
//	self.view.backgroundColor = [UIColor underPageBackgroundColor];
	
	// NavigationBarの作成
	navBar_ = [[UINavigationBar alloc] initWithFrame:frame];
	navBar_.tintColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:0.1];
//	navBar_.tintColor = [UIColor grayColor];
	title_ = [[UINavigationItem alloc] initWithTitle:@"Flick Mail"];
	frame.size = [navBar_ sizeThatFits:frame.size];
	[navBar_ setFrame:frame];
	
#if TOOLBAR
	// Toolbarの作成
	UIBarButtonItem* mailToolbarButton = [[UIBarButtonItem alloc] initWithTitle:@"Mail" style:UIBarButtonItemStyleBordered target:nil action:nil];
	UIBarButtonItem* imToolbarButton = [[UIBarButtonItem alloc] initWithTitle:@"iMessages" style:UIBarButtonItemStyleBordered target:nil action:nil];
	UIBarButtonItem* twitterToolbarButton = [[UIBarButtonItem alloc] initWithTitle:@"twitter" style:UIBarButtonItemStyleDone target:nil action:nil];
	//[self setToolbarItems:toolbarButtons_ animated:YES];
	frame = self.view.bounds;
	toolBar_ = [[UIToolbar alloc] initWithFrame:frame];
	toolBar_.tintColor = [UIColor blackColor];
	frame.size = [toolBar_ sizeThatFits:frame.size];
	frame.origin.y = self.view.bounds.size.height - frame.size.height;
	[toolBar_ setFrame:frame];
	[toolBar_ setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[toolBar_ setItems:[NSArray arrayWithObjects:
						mailToolbarButton,
						imToolbarButton,
						twitterToolbarButton,
						nil
						]];
//	[toolBar_ setItems:toolbarButton];
	[self.view addSubview:toolBar_];
#endif
	
	// ボタン生成
	UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
																   style:UIBarButtonSystemItemAdd
																  target:self
																  action:@selector(addButtonDidPush)];
	title_.rightBarButtonItem = addButton;
	
	// ボタン生成
	UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
																   style:UIBarButtonSystemItemAdd
																  target:self
																  action:@selector(addButtonDidPush)];
	title_.leftBarButtonItem = editButton;
	
	[navBar_ pushNavigationItem:title_ animated:YES];
	[self.view addSubview:navBar_];
	
	// set initial word
	words1_ = [[NSMutableArray alloc] init];
	words2_ = [[NSMutableArray alloc] init];
	words3_ = [[NSMutableArray alloc] init];
	
	[words1_ addObject:@"words1-1"];
	[words1_ addObject:@"words1-2"];
	[words2_ addObject:@"words2-1"];
	[words2_ addObject:@"words2-2"];
	[words3_ addObject:@"words3-1"];
	[words3_ addObject:@"words3-2"];
	
    mailText_ = [[NSString alloc] init];
    mailText_ = [(NSString*)words1_[0] stringByAppendingString:(NSString*)words2_[0]];
	
    /* ---------- titleLabel ---------- */
//    UIFont* labelFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:30];
//    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160 - commonWidth/2, SPACE, commonWidth, titleHeight)];
//    titleLabel.text = @"Flick Mail";
//    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    titleLabel.textAlignment = UITextAlignmentCenter;
//    titleLabel.font = labelFont;
//    titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//    titleLabel.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.2 alpha:1.0];
//    [self.view addSubview:titleLabel];
    
    /* ---------- editButton ---------- */
//    UIFont* editButtonFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:40];
//    UIButton* editButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [editButton setTitle:@"⚙" forState:UIControlStateNormal];
//    [editButton sizeToFit];
//    editButton.titleLabel.font = editButtonFont;
//    editButton.frame = CGRectMake(SPACE, SPACE, 60, titleHeight);
//    [editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    editButton.showsTouchWhenHighlighted = YES;
//    editButton.backgroundColor = [UIColor orangeColor];
//    [editButton addTarget:self
//                   action:@selector(mailSendButtonDidPush)
//         forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:editButton];
    
    /* ---------- addButton ---------- */
//    UIFont* addButtonFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:40];
//    UIButton* addButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [addButton setTitle:@"✎" forState:UIControlStateNormal];
//    [addButton sizeToFit];
//    addButton.titleLabel.font = addButtonFont;
//    addButton.frame = CGRectMake(160 + commonWidth/2 + SPACE, SPACE, 60, titleHeight);
//    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    addButton.showsTouchWhenHighlighted = YES;
//    addButton.backgroundColor = [UIColor redColor];
//    [addButton addTarget:self
//				  action:@selector(addButtonDidPush)
//		forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:addButton];
    
    /* ---------- scrollView1_ ---------- */
    scrollView1_ = [[UIScrollView alloc] initWithFrame:
				   CGRectMake(scrollView1_x,
							  scrollView1_y,
							  commonWidth,
							  scrollWordHeight)];
    scrollView1_.delegate = self;
    scrollView1_.contentSize = CGSizeMake(commonWidth * wordNumberOfPages, scrollWordHeight);
    scrollView1_.pagingEnabled = YES;
    scrollView1_.scrollsToTop = NO;
    scrollView1_.clipsToBounds = NO;
//	scrollView1_.layer.shadowOpacity = 0.8;
//	scrollView1_.layer.shadowOffset = CGSizeMake(2, 2);
    //スクロールビューにviewを設定
    for( int i = 0; i < wordNumberOfPages; ++i)
    {
		wordViewController1_ = [[WordViewController alloc] init];
		wordViewController1_.word_ = [NSString stringWithFormat:(NSString*)words1_[i]];
		wordViewController1_.view.frame = CGRectMake( commonWidth * i, 0, commonWidth, scrollWordHeight);
		[scrollView1_ addSubview:wordViewController1_.view];
	}

	[baseScrollView_ addSubview:scrollView1_];
	
    /* ---------- scrollView2_ ---------- */
    scrollView2_ = [[UIScrollView alloc] initWithFrame:
				   CGRectMake(scrollView2_x,
							  scrollView2_y,
							  commonWidth,
							  scrollWordHeight)];
	scrollView2_.delegate = self;
    scrollView2_.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    scrollView2_.contentSize = CGSizeMake(commonWidth * wordNumberOfPages, scrollWordHeight);
    scrollView2_.pagingEnabled = YES;
    scrollView2_.scrollsToTop = NO;
    scrollView2_.clipsToBounds = NO;
//	scrollView2_.layer.shadowOpacity = 0.8;
//	scrollView2_.layer.shadowOffset = CGSizeMake(2, 2);

//	for( int i = 0; i < wordNumberOfPages; ++i)
//    {
//		wordViewController2_ = [[WordViewController alloc] init];
//		wordViewController2_.word_ = [NSString stringWithFormat:@"word%d",i+1];
//		wordViewController2_.view.frame = CGRectMake( commonWidth * i, 0, commonWidth, scrollWordHeight);
//		[scrollView2_ addSubview:wordViewController2_.view];
//	}
	for( int i = 0; i < wordNumberOfPages; ++i)
    {
		wordViewController2_ = [[WordViewController alloc] init];
		wordViewController2_.word_ = [NSString stringWithFormat:(NSString*)words2_[i]];
		wordViewController2_.view.frame = CGRectMake( commonWidth * i, 0, commonWidth, scrollWordHeight);
		[scrollView2_ addSubview:wordViewController2_.view];
	}
	
    [baseScrollView_ addSubview:scrollView2_];
	
	/* ---------- scrollView3_ ---------- */
    scrollView3_ = [[UIScrollView alloc] initWithFrame:
					CGRectMake(scrollView3_x,
							   scrollView3_y,
							   commonWidth,
							   scrollWordHeight)];
	scrollView3_.delegate = self;
    scrollView3_.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    scrollView3_.contentSize = CGSizeMake(commonWidth * wordNumberOfPages, scrollWordHeight);
    scrollView3_.pagingEnabled = YES;
    scrollView3_.scrollsToTop = NO;
    scrollView3_.clipsToBounds = NO;
	//	scrollView3_.layer.shadowOpacity = 0.8;
	//	scrollView3_.layer.shadowOffset = CGSizeMake(2, 2);
	
	//	for( int i = 0; i < wordNumberOfPages; ++i)
	//    {
	//		wordViewController2_ = [[WordViewController alloc] init];
	//		wordViewController2_.word_ = [NSString stringWithFormat:@"word%d",i+1];
	//		wordViewController2_.view.frame = CGRectMake( commonWidth * i, 0, commonWidth, scrollWordHeight);
	//		[scrollView3_ addSubview:wordViewController2_.view];
	//	}
	for( int i = 0; i < wordNumberOfPages; ++i)
    {
		wordViewController3_ = [[WordViewController alloc] init];
		wordViewController3_.word_ = [NSString stringWithFormat:(NSString*)words3_[i]];
		wordViewController3_.view.frame = CGRectMake( commonWidth * i, 0, commonWidth, scrollWordHeight);
		[scrollView3_ addSubview:wordViewController3_.view];
	}
	
    [baseScrollView_ addSubview:scrollView3_];

    
    /* ---------- emailButton ---------- */
    UIFont* buttonFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:30];
    UIButton* emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[emailButton setTitle:@"MAIL" forState:UIControlStateNormal];
	[emailButton sizeToFit];
	emailButton.titleLabel.font = buttonFont;
	emailButton.frame = CGRectMake(60+SPACE*2, button_y, commonWidth/2 - SPACE/2, 75);
    [emailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//	emailButton.layer.shadowOpacity = 0.8;
	emailButton.showsTouchWhenHighlighted = YES;
    [emailButton addTarget:self
					action:@selector(mailSendButtonDidPush)
		  forControlEvents:UIControlEventTouchUpInside];
    emailButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1.0];
    [baseScrollView_ addSubview:emailButton];
	
    /* ---------- messageButton ---------- */
    UIButton* messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageButton setTitle:@"IM" forState:UIControlStateNormal];
    [messageButton sizeToFit];
    messageButton.titleLabel.font = buttonFont;
    messageButton.frame = CGRectMake(60 + SPACE*2.5 + commonWidth/2, button_y, commonWidth/2 -SPACE/2, 75);
    [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//	messageButton.layer.shadowOpacity = 0.8;
    messageButton.showsTouchWhenHighlighted = YES;
    [messageButton addTarget:self
					  action:@selector(messageSendButtonDidPush)
			forControlEvents:UIControlEventTouchUpInside];
    messageButton.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.1 alpha:1.0];
    [baseScrollView_ addSubview:messageButton];
    
    /* ---------- twitterButton ---------- */
    UIFont* twitterButtonFont = [UIFont fontWithName:@"Verdana-Bold" size:40];
    UIButton* twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [twitterButton setTitle:@"t" forState:UIControlStateNormal];
    [twitterButton sizeToFit];
    twitterButton.titleLabel.font = twitterButtonFont;
    twitterButton.frame = CGRectMake(160 + commonWidth/2 + SPACE, button_y, 60, 75);
    [twitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//	twitterButton.layer.shadowOpacity = 0.8;
    twitterButton.showsTouchWhenHighlighted = YES;
    twitterButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.7 blue:0.95 alpha:1.0];
    [twitterButton addTarget:self
					  action:@selector(mailSendButtonDidPush)
			forControlEvents:UIControlEventTouchUpInside];
    [baseScrollView_ addSubview:twitterButton];
	
	/* ---------- メール本文 ---------- */
	NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
	// キーボード表示時
    [notification addObserver:self selector:@selector(keyboardWillShow:) 
						 name:UIKeyboardWillShowNotification object:nil];
	
	UIFont* mailTextFont = [UIFont fontWithName:@"STHeitiSC-Medium" size:30];
	mailTextView_ = [[UITextView alloc] init];
	mailTextView_.frame = CGRectMake(0, mailText_y, 320, mailTextHeight);
	//mailTextView_.center = CGPointMake(160, button_y);
	mailTextView_.backgroundColor = [UIColor whiteColor];
	mailTextView_.font = mailTextFont;
	mailTextView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	mailTextView_.text = mailText_;
	
	[baseScrollView_ addSubview:mailTextView_];
	
	// set Notification center
	[self registerForKeyboardNotifications];
}

/*
 * show the keyboard and up the scrollView
 */
- (void)keyboardWillShow:(NSNotification *)notificatioin
{
    // ここでTextFieldやTextViewの位置を変更する
    NSLog(@"keyboardWillShow");
	
	title_.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																			  target:self
																			  action:@selector(doneButtonDidPush)];
}

- (void)registerForKeyboardNotifications
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillBeHidden:)
												 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{ 
	CGPoint scrollPoint = CGPointMake(0.0,250.0);
	[baseScrollView_ setContentOffset:scrollPoint animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
	[baseScrollView_ setContentOffset:CGPointZero animated:YES];
}

///*
// *  キーボード非表示
// */
//- (void)keyboardWillHide:(NSNotification *)notificatioin
//{
//    // ここでTextFieldやTextViewの位置を戻す
//    NSLog(@"keyboardWillHide");    
//    
//    // キーボードに合わせたアニメーション処理
//    [UIView animateWithDuration:0.3f
//                     animations:^{
//                         
//                         // TextFieldのframe
//                         CGRect viewRect = mailTextView_.frame;
//                         
//                         // TextFieldのY座標を元の位置に定義
//                         viewRect.origin.y = 420.0f;
//                         mailTextView_.frame = viewRect;
//                     }];
//}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	if (scrollView == scrollView1_)
	{
		currentViewNum1_ = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
	}
	else if (scrollView == scrollView2_)
	{
		currentViewNum2_ = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
	}
	else if (scrollView == scrollView3_)
	{
		currentViewNum3_ = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
	}
	else
	{
		;
	}
//    mailText_ = [(NSString*)words1_[currentViewNum1_] stringByAppendingString:(NSString*)words2_[currentViewNum2_]];
    NSString* words1_2 = [(NSString*)words1_[currentViewNum1_] stringByAppendingString:(NSString*)words2_[currentViewNum2_]];
	mailText_ = [words1_2 stringByAppendingString:(NSString*)words3_[currentViewNum3_]];
	mailTextView_.text = mailText_;

}

- (void)viewDidUnload
{
//    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d-%d", row, component];
}

- (void)addButtonDidPush
{
	AddNewWordViewController *addNewWordViewController = [[AddNewWordViewController alloc] init];
//	addNewWordViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
//	[self presentModalViewController:addNewWordViewController animated:YES];
	[self presentViewController:addNewWordViewController animated:YES completion:nil];
	
}

// push done button
- (void)doneButtonDidPush
{
[mailTextView_ resignFirstResponder];
}

- (void)mailSendButtonDidPush
{
	//    UIAlertView* mailSendAlert = [[UIAlertView alloc] init];
	//    mailSendAlert.delegate = self;
	//    mailSendAlert.title = @"send this mail?";
	//    [mailSendAlert addButtonWithTitle:@"cancel"];
	//    [mailSendAlert addButtonWithTitle:@"send"];
	//    mailSendAlert.cancelButtonIndex = 0;
	//    [mailSendAlert show];
    
    if([MFMailComposeViewController canSendMail] == YES)
    {
        NSLog(@"Sent mail");
        MFMailComposeViewController *mcViewController = [[MFMailComposeViewController alloc] init];
        mcViewController.mailComposeDelegate = self;
        [mcViewController setSubject:@"test subject"];
//        [mcViewController setMessageBody:@"test message \n\n Sent from FlickMail" isHTML:NO];
		[mcViewController setMessageBody:mailText_ isHTML:NO];
        [mcViewController setToRecipients:[NSArray arrayWithObjects:@"g.stranger828@gmail.com", nil]];
        [self presentModalViewController:mcViewController animated:YES];
    }
    else
    {
        NSLog(@"cannot sent mail");
    }
    
}

- (void)messageSendButtonDidPush
{
    if([MFMessageComposeViewController canSendText] == YES)
    {
        NSLog(@"Sent message");
        MFMessageComposeViewController *imcViewController = [[MFMessageComposeViewController alloc] init];
        imcViewController.messageComposeDelegate = self;
		//        [imcViewController setSubject:@"test subject"];
		//        [imcViewController setMessageBody:@"test message \n\n Sent from FlickMail" isHTML:NO];
        imcViewController.recipients = [NSArray arrayWithObjects:@"g.stranger828@gmail.com", nil];
        [self presentModalViewController:imcViewController animated:YES];
    }
    else
    {
        NSLog(@"cannot sent message");
    }
	
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != alertView.cancelButtonIndex)
    {
        if([MFMailComposeViewController canSendMail] == YES)
        {
            NSLog(@"Sent mail");
            MFMailComposeViewController *mcViewController = [[MFMailComposeViewController alloc] init];
            mcViewController.mailComposeDelegate = self;
            [mcViewController setSubject:@"test subject"];
//          [mcViewController setMessageBody:@"test message \n\n Sent from FlickMail" isHTML:NO];
			[mcViewController setMessageBody:mailText_ isHTML:NO];
            [mcViewController setToRecipients:[NSArray arrayWithObjects:@"g.stranger828@gmail.com", nil]];
            [self presentModalViewController:mcViewController animated:YES];
        }
        else
        {
            NSLog(@"cannot sent mail");
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result){
        case MFMailComposeResultCancelled:  // cancel
            break;
        case MFMailComposeResultSaved:      // save
            break;
        case MFMailComposeResultSent:       // success
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Success"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        case MFMailComposeResultFailed:     // failed
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Failed"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{    
    switch (result){
        case MessageComposeResultCancelled:  // cancel
            break;
        case MessageComposeResultSent:       // success
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Success"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        case MessageComposeResultFailed:     // failed
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Failed"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
	
}

@end
