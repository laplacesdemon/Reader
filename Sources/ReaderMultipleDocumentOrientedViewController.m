//
//  ReaderMultipleDocumentOrientedViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import "ReaderMultipleDocumentOrientedViewController.h"
#import "ReaderContentView.h"

@interface ReaderMultipleDocumentOrientedViewController ()
- (void)adjustViewsForOrientation:(UIInterfaceOrientation)interfaceOrientation;
@end

@implementation ReaderMultipleDocumentOrientedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    [self adjustViewsForOrientation:currentOrientation];
}

- (void)viewWillAppear:(BOOL)animated
{
    // adjust the views for the current orientation
    UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    [self adjustViewsForOrientation:currentOrientation];
}

- (NSInteger)nextPageNumber
{
    NSInteger nextPageNumber;
    UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(currentOrientation)) {
        nextPageNumber = (self.pageNumber + 2 <= self.document.pageCount.integerValue) ? self.pageNumber + 2 : 0;
    } else {
        nextPageNumber = (self.pageNumber + 1 <= self.document.pageCount.integerValue) ? self.pageNumber + 1 : 0;
    }
    return nextPageNumber;
}

- (NSInteger)prevPageNumber
{
    NSInteger prevPageNumber;
    UIInterfaceOrientation currentOrientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(currentOrientation)) {
        prevPageNumber = (self.pageNumber <= 1) ? 0 : self.pageNumber - 2;
    } else {
        prevPageNumber = (self.pageNumber <= 1) ? 0 : self.pageNumber - 1;
    }
    return prevPageNumber;
}

#pragma mark - orientation support

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self adjustViewsForOrientation:toInterfaceOrientation];
}

#pragma mark - private methods

- (void)adjustViewsForOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        // show the right pdf view
        [self.contentViewRight setHidden:NO];
        
        // adjust the view frames
        CGRect selfFrame = self.view.frame;
        CGRect leftPDFFrame = CGRectMake(selfFrame.origin.x, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height);
        [self.contentViewLeft setFrame:leftPDFFrame];
        
        CGRect rightFrame = CGRectMake(selfFrame.size.width / 2, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height);
        [self.contentViewRight setFrame:rightFrame];
    } else {
        // hide the right pdf view
        [self.contentViewRight setHidden:YES];
        
        // adjust the view space for the left view
        CGRect selfFrame = self.view.frame;
        CGRect leftPDFFrame = CGRectMake(selfFrame.origin.x, selfFrame.origin.y, selfFrame.size.width, selfFrame.size.height);
        [self.contentViewLeft setFrame:leftPDFFrame];
    }
}

@end
