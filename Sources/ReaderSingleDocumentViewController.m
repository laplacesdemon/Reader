//
//  ReaderSingleDocumentViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderSingleDocumentViewController.h"
#import "ReaderContentView.h"
#import "ReaderDocument.h"

@interface ReaderSingleDocumentViewController ()

@end

@implementation ReaderSingleDocumentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Document properties
    NSURL *fileURL = self.document.fileURL;
    NSString *phrase = self.document.password;
    
    ReaderContentView *contentView = [[ReaderContentView alloc] initWithFrame:self.view.frame
                                                                      fileURL:fileURL
                                                                         page:self.pageNumber
                                                                     password:phrase];
    [self.view addSubview:contentView];
}

- (NSInteger)nextPageNumber
{
    return (self.pageNumber + 1 <= self.document.pageCount.integerValue) ? self.pageNumber + 1 : 0;
}

- (NSInteger)prevPageNumber
{
    return (self.pageNumber <= 1) ? 0 : self.pageNumber - 1;
}

@end
