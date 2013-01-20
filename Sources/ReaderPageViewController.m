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
#import "ReaderMultipleDocumentOrientedViewController.h"
#import "ReaderConstants.h"
#import "ReaderDocumentFactory.h"

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

+ (ReaderPageViewController *)readerPageViewControllerWithDocument:(ReaderDocument *)aDocument
                                                     displayOption:(ReaderDisplayOption)theDisplayOption
{
    ReaderPageViewController *ctrl =
    [[ReaderPageViewController alloc] initWithReaderDocument:aDocument
                                               displayOption:theDisplayOption];
    [ctrl setDataSource:ctrl];
    [ctrl setDelegate:ctrl];
    
    ReaderBaseDocumentBViewController *documentController =
    [ReaderDocumentFactory documentViewControllerForDisplayOption:theDisplayOption
                                                       pageNumber:1
                                                         document:aDocument];
    
    [documentController setPageNumber:1];
    NSArray *ctrls = [NSArray arrayWithObjects:documentController, nil];
    
    [ctrl setViewControllers:ctrls direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        // completed
    }];
    
    return ctrl;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self dismissModalViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dismissed" object:nil];
    
    /*
    // reset controllers
    ReaderBaseDocumentBViewController *currentViewController = self.viewControllers[0];
    
    NSInteger pageNr;
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        pageNr = currentViewController.pageNumber / 2;
    } else {
        pageNr = currentViewController.pageNumber;
    }
    
    ReaderBaseDocumentBViewController *documentController =
    [ReaderDocumentFactory documentViewControllerForDisplayOption:_displayOption
                                                       pageNumber:pageNr
                                                         document:_document];
    
    NSArray *ctrls = [NSArray arrayWithObjects:documentController, nil];
    [self setViewControllers:ctrls direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    
    */
    
    NSLog(@"hell yeah");
}

#pragma mark - uipageviewcontroller datasource

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController
                   spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    NSLog(@"hoih");
    return UIPageViewControllerSpineLocationMin;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(ReaderBaseDocumentBViewController *)viewController
{
    NSInteger totalPages = _document.pageCount.integerValue;
    // previous page
    NSInteger pageIndex = [viewController prevPageNumber];
    NSLog(@"before: %d", pageIndex);
    if (pageIndex > 0 && pageIndex <= totalPages) {
        return [ReaderDocumentFactory documentViewControllerForDisplayOption:_displayOption
                                                                  pageNumber:pageIndex
                                                                    document:_document];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(ReaderBaseDocumentBViewController *)viewController
{
    NSInteger totalPages = _document.pageCount.integerValue;
    // next page
    NSInteger pageIndex = [viewController nextPageNumber];
    NSLog(@"next: %d", pageIndex);
    if (pageIndex > 0 && pageIndex <= totalPages) {
        return [ReaderDocumentFactory documentViewControllerForDisplayOption:_displayOption
                                                                  pageNumber:pageIndex
                                                                    document:_document];
    }
    return nil;
}

@end
