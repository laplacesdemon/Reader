//
//  Reader.h
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import <Foundation/Foundation.h>
#define kReaderDidDismiss @"ReaderDidDismiss"

@class ReaderDocument;

@interface Reader : UIViewController
@property (nonatomic, strong) ReaderDocument *document;

- (id)initWithDocument:(ReaderDocument *)document;

@end
