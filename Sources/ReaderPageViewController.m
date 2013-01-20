//
//  ReaderPageViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderPageViewController.h"
#import "ReaderContentView.h"
#import "ReaderBaseDocumentBViewController.h"
#import "ReaderSingleDocumentViewController.h"
#import "ReaderMultipleDocumentViewController.h"
#import "ReaderConstants.h"

@interface ReaderPageViewController ()

@end

@implementation ReaderPageViewController
{
    ReaderDocument *_document;
}
@synthesize displayOption = _displayOption;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument displayOption:(ReaderDisplayOption)theDisplayOption
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        _document = aDocument;
        _displayOption = theDisplayOption;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (ReaderPageViewController *)readerPageViewControllerWithDocument:(ReaderDocument *)aDocument displayOption:(ReaderDisplayOption)theDisplayOption
{
    ReaderPageViewController *ctrl = [[ReaderPageViewController alloc] initWithReaderDocument:aDocument displayOption:theDisplayOption];
    [ctrl setDataSource:ctrl];
    ReaderBaseDocumentBViewController *documentController = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:aDocument];
    
    [documentController setPageNumber:1];
    NSArray *ctrls = [NSArray arrayWithObjects:documentController, nil];
    
    [ctrl setViewControllers:ctrls direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        // completed
    }];
    
    return ctrl;
}

#pragma mark - uipageviewcontroller datasource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(ReaderBaseDocumentBViewController *)viewController
{
    NSInteger totalPages = _document.pageCount.integerValue;
    // previous page
    NSInteger pageIndex = [viewController prevPageNumber];
    if (pageIndex > 0 && pageIndex <= totalPages) {
        if (_displayOption == ReaderDisplayOptionDoublePage || _displayOption == ReaderDisplayOptionDoublePageOnLandscape) {
            ReaderMultipleDocumentViewController *ctrl = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:_document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        } else {
            ReaderSingleDocumentViewController *ctrl = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:_document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        }
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(ReaderBaseDocumentBViewController *)viewController
{
    NSInteger totalPages = _document.pageCount.integerValue;
    // previous page
    NSInteger pageIndex = [viewController nextPageNumber];
    if (pageIndex > 0 && pageIndex <= totalPages) {
        if (_displayOption == ReaderDisplayOptionDoublePage || _displayOption == ReaderDisplayOptionDoublePageOnLandscape) {
            ReaderMultipleDocumentViewController *ctrl = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:_document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        } else {
            ReaderSingleDocumentViewController *ctrl = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:_document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        }
    }
    return nil;
}

@end
