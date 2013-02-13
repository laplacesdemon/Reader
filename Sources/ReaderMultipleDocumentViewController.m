//
//  ReaderMultipleDocumentViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderMultipleDocumentViewController.h"

@interface ReaderMultipleDocumentViewController ()

@end

@implementation ReaderMultipleDocumentViewController
@synthesize contentViewLeft = _contentViewLeft;
@synthesize contentViewRight = _contentViewRight;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Document properties
    NSURL *fileURL = self.document.fileURL;
    NSString *phrase = self.document.password;
    
    // set the pdf document on the left
    CGRect selfFrame = self.view.frame;
    _contentViewLeft = [[ReaderContentView alloc] initWithFrame:CGRectMake(selfFrame.origin.x, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                        fileURL:fileURL
                                                           page:self.pageNumber
                                                       password:phrase
                                                   isDoublePage:YES];
    
    // set the pdf document on the right
    [_contentViewLeft showPageThumb:fileURL page:self.pageNumber password:phrase guid:self.document.guid];
    
    _contentViewRight = [[ReaderContentView alloc] initWithFrame:CGRectMake(selfFrame.size.width / 2, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber + 1
                                                        password:phrase isDoublePage:YES];
    
    // add them to the main view
    [self.view addSubview:_contentViewLeft];
    [self.view addSubview:_contentViewRight];
}

- (NSInteger)nextPageNumber
{
    return (self.pageNumber + 2 <= self.document.pageCount.integerValue) ? self.pageNumber + 2 : 0;
}

- (NSInteger)prevPageNumber
{
    return (self.pageNumber <= 1) ? 0 : self.pageNumber - 2;
}

@end
