//
//  ReaderMultipleDocumentViewController.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/10/13.
//
//

#import "ReaderBaseDocumentBViewController.h"
#import "ReaderContentView.h"

@interface ReaderMultipleDocumentViewController : ReaderBaseDocumentBViewController

@property (nonatomic, strong) ReaderContentView *contentViewLeft;
@property (nonatomic, strong) ReaderContentView *contentViewRight;

@end
