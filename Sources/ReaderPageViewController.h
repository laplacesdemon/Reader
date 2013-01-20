//
//  ReaderPageViewController.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import <UIKit/UIKit.h>
#import "ReaderDocument.h"

typedef enum {
    ReaderDisplayOptionDoublePage,
    ReaderDisplayOptionDoublePageOnLandscape,
    ReaderDisplayOptionSinglePage
} ReaderDisplayOption;

/**
 * The main reader view controller
 * Features:
 *      Transitions that UIPageViewController offers (curl and scroll)
 *      Displaying double pdf page
 */
@interface ReaderPageViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic) ReaderDisplayOption displayOption;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument displayOption:(ReaderDisplayOption)displayOption;

+ (ReaderPageViewController *)readerPageViewControllerWithDocument:(ReaderDocument *)aDocument displayOption:(ReaderDisplayOption)displayOption;

@end
