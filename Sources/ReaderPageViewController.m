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
    ReaderDocument *document;
}
@synthesize useMultipleDocuments;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        document = aDocument;
        useMultipleDocuments = NO; // default value
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

+ (ReaderPageViewController *)readerPageViewControllerWithDocument:(ReaderDocument *)aDocument
{
    ReaderPageViewController *ctrl = [[ReaderPageViewController alloc] initWithReaderDocument:aDocument];
    [ctrl setDataSource:ctrl];
    ReaderBaseDocumentBViewController *documentController;
#if (READER_DOUBLE_PAGE_IPAD == TRUE)
    [ctrl setUseMultipleDocuments:YES];
    documentController = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:aDocument];
#else
    [ctrl setUseMultipleDocuments:NO];
    documentController = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:aDocument];
#endif
    
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
    NSInteger totalPages = document.pageCount.integerValue;
    // previous page
    NSInteger pageIndex = [viewController prevPageNumber];
    if (pageIndex > 0 && pageIndex <= totalPages) {
        if (useMultipleDocuments) {
            ReaderMultipleDocumentViewController *ctrl = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        } else {
            ReaderSingleDocumentViewController *ctrl = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        }
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(ReaderBaseDocumentBViewController *)viewController
{
    NSInteger totalPages = document.pageCount.integerValue;
    // previous page
    NSInteger pageIndex = [viewController nextPageNumber];
    if (pageIndex > 0 && pageIndex <= totalPages) {
        if (useMultipleDocuments) {
            
            ReaderMultipleDocumentViewController *ctrl = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        } else {
            ReaderSingleDocumentViewController *ctrl = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:document];
            [ctrl setPageNumber:pageIndex];
            return ctrl;
        }
    }
    return nil;
}

@end
