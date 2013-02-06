//
//  MailEditViewController.h
//  FlickMail
//
//  Created by 幸紀 寺岡 on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "WordViewController.h"
#import "AddNewWordViewController.h"
//#import <MessageUI/MFMailComposeViewController.h>
//#import <MessageUI/MFMessageComposeViewController.h>

@interface MailEditViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, UIScrollViewDelegate>
{
	UIScrollView* baseScrollView_;
	// navigation bar
	UINavigationBar* navBar_;
	UINavigationItem* title_;
	// tooolbar items
	UIToolbar* toolBar_;
	NSArray* toolbarButtons_;
	// string of mail text
    NSString* mailText_;
	// array of keyword
	NSMutableArray* words1_;
	NSMutableArray* words2_;
	NSMutableArray* words3_;
	// number of current view
	NSInteger currentViewNum1_;
	NSInteger currentViewNum2_;
	NSInteger currentViewNum3_;
	// scrroll view of keywords
	UIScrollView* scrollView1_;
	UIScrollView* scrollView2_;
	UIScrollView* scrollView3_;
	
	UITextView* mailTextView_;
	
	WordViewController* wordViewController1_;
	WordViewController* wordViewController2_;
	WordViewController* wordViewController3_;
}

- (void)sendButtonDidPush;
- (void)registerForKeyboardNotifications;

@end
