//
//  ReaderMultipleDocumentViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderMultipleDocumentViewController.h"
#import "ReaderContentView.h"

@interface ReaderMultipleDocumentViewController ()

@end

@implementation ReaderMultipleDocumentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Document properties
    NSURL *fileURL = self.document.fileURL;
    NSString *phrase = self.document.password;
    
    CGRect selfFrame = self.view.frame;
    ReaderContentView *contentViewLeft = [[ReaderContentView alloc] initWithFrame:CGRectMake(0, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber
                                                                     password:phrase];
    [contentViewLeft showPageThumb:fileURL page:self.pageNumber password:phrase guid:self.document.guid];
    ReaderContentView *contentViewRight = [[ReaderContentView alloc] initWithFrame:CGRectMake(selfFrame.size.width / 2, selfFrame.origin.y, selfFrame.size.width / 2, selfFrame.size.height)
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber + 1
                                                                     password:phrase];

    NSLog(@"self frame x:%f y:%f w:%f h:%f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"contentViewLeft frame x:%f y:%f w:%f h:%f", contentViewLeft.frame.origin.x, contentViewLeft.frame.origin.y, contentViewLeft.frame.size.width, contentViewLeft.frame.size.height);
    NSLog(@"contentViewRight frame x:%f y:%f w:%f h:%f", contentViewRight.frame.origin.x, contentViewRight.frame.origin.y, contentViewRight.frame.size.width, contentViewRight.frame.size.height);
    
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
