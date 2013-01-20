//
//  ReaderBaseDocumentBViewController.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import <UIKit/UIKit.h>
#import "ReaderDocument.h"

@interface ReaderBaseDocumentBViewController : UIViewController
@property (nonatomic) NSInteger pageNumber;
@property (nonatomic, strong) ReaderDocument *document;

- (id)initWithReaderDocument:(ReaderDocument *)aDocument;

- (NSInteger)prevPageNumber;
- (NSInteger)nextPageNumber;

@end
