//
//  ReaderMultipleDocumentViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderMultipleDocumentViewController.h"
#import "ReaderContentView.h"
#import <QuartzCore/QuartzCore.h>

@interface ReaderMultipleDocumentViewController ()

@end

@implementation ReaderMultipleDocumentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Document properties
    NSURL *fileURL = self.document.fileURL;
    NSString *phrase = self.document.password;
    
    // set the pdf document on the left
    CGRect selfFrame = self.view.frame;
    ReaderContentView *contentViewLeft = [[ReaderContentView alloc] initWithFrame:CGRectMake(0, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber
                                                                     password:phrase];
    
    // set the pdf document on the right
    [contentViewLeft showPageThumb:fileURL page:self.pageNumber password:phrase guid:self.document.guid];
    ReaderContentView *contentViewRight = [[ReaderContentView alloc] initWithFrame:CGRectMake(selfFrame.size.width / 2, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber + 1
                                                                     password:phrase];
    
    // add them to the main view
    [self.view addSubview:contentViewLeft];
    [self.view addSubview:contentViewRight];

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
