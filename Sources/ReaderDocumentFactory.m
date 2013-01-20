//
//  ReaderDocumentFactory.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import "ReaderDocumentFactory.h"
#import "ReaderBaseDocumentBViewController.h"
#import "ReaderDocument.h"
#import "ReaderSingleDocumentViewController.h"
#import "ReaderMultipleDocumentOrientedViewController.h"
#import "ReaderMultipleDocumentViewController.h"

@implementation ReaderDocumentFactory

+ (ReaderBaseDocumentBViewController *)documentViewControllerForDisplayOption:(ReaderDisplayOption)displayOption
                                                                   pageNumber:(NSInteger)pageIndex
                                                                     document:(ReaderDocument *)document
{
    ReaderBaseDocumentBViewController *ctrl;
    if (displayOption == ReaderDisplayOptionDoublePage) {
        ctrl = [[ReaderMultipleDocumentViewController alloc] initWithReaderDocument:document];
    } else if (displayOption == ReaderDisplayOptionDoublePageOnLandscape) {
        ctrl = [[ReaderMultipleDocumentOrientedViewController alloc] initWithReaderDocument:document];
    } else {
        ctrl = [[ReaderSingleDocumentViewController alloc] initWithReaderDocument:document];
    }
    [ctrl setPageNumber:pageIndex];
    return ctrl;
}

@end
