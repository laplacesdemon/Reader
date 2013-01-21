//
//  ReaderBaseDocumentBViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderBaseDocumentBViewController.h"

@interface ReaderBaseDocumentBViewController ()

@end

@implementation ReaderBaseDocumentBViewController
@synthesize pageNumber;
@synthesize document;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument
{
    self = [super init];
    if (self) {
        document = aDocument;
        pageNumber = 1;
    }
    return self;
}

// must be overridden
- (NSInteger)prevPageNumber
{
    return 0;
}

- (NSInteger)nextPageNumber
{
    return 0;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self dismissModalViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReaderDidDismiss" object:self];
}

@end
