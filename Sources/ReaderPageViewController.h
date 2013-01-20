//
//  ReaderPageViewController.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import <UIKit/UIKit.h>
#import "ReaderDocument.h"

@interface ReaderPageViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic) BOOL useMultipleDocuments;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument;

+ (ReaderPageViewController *)readerPageViewControllerWithDocument:(ReaderDocument *)aDocument;

@end
