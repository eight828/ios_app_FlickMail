//
//  WordViewController.h
//  FlickMail
//
//  Created by Koki-Teraoka on 6/17/12.
//
//

#import <UIKit/UIKit.h>

@interface WordViewController : UIViewController
{
@private
	NSInteger number_;
	NSString* word_;
}

@property (nonatomic, assign) NSInteger number_;
@property (nonatomic) NSString* word_;

//数値を指定してMyViewControllerのインスタンスを取得する
//+ (WordViewController*)wordViewControllerWithNumber:(NSInteger)number;

@end
