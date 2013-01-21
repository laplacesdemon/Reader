//
//  ReaderMainViewController.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import <UIKit/UIKit.h>

@class ReaderPageViewController, ReaderDocument;

@interface ReaderMainViewController : UIViewController

@property (nonatomic, strong) ReaderDocument *document;
@property (nonatomic, strong) ReaderPageViewController *pageViewController;

- (id)initWithDocument:(ReaderDocument *)document startPage:(NSInteger)startPage;

@end
