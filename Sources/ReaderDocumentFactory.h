//
//  ReaderDocumentFactory.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import <Foundation/Foundation.h>
#import "ReaderPageViewController.h"

@class ReaderBaseDocumentBViewController, ReaderDocument;

@interface ReaderDocumentFactory : NSObject

+ (ReaderBaseDocumentBViewController *)documentViewControllerForDisplayOption:(ReaderDisplayOption)displayOption
                                                                   pageNumber:(NSInteger)pageIndex
                                                                     document:(ReaderDocument *)document;

@end
