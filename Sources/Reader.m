//
//  Reader.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import "Reader.h"
#import "ReaderDocument.h"
#import "ReaderMainViewController.h"
#import "ReaderBaseDocumentBViewController.h"

@interface Reader()
- (void)presentControllerStartPage:(NSInteger)startPage animated:(BOOL)animated;
- (void)readerDidDismiss:(NSNotification *)notification;
@end

@implementation Reader
@synthesize document;

- (id)initWithDocument:(ReaderDocument *)aDocument
{
    self = [super init];
    if (self) {
        document = aDocument;
    }
    return self;
}

- (void)viewDidLoad
{
    // register notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(readerDidDismiss:) name:@"dismissed" object:nil];
    
    // present controller
    [self presentControllerStartPage:1 animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - private methods

- (void)presentControllerStartPage:(NSInteger)startPage animated:(BOOL)animated
{
    ReaderMainViewController *ctrl = [[ReaderMainViewController alloc] initWithDocument:self.document startPage:startPage];
    
    ctrl.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    ctrl.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentModalViewController:ctrl animated:animated];
}

- (void)readerDidDismiss:(NSNotification *)notification
{
    ReaderBaseDocumentBViewController *ctrl = (ReaderBaseDocumentBViewController *)[notification object];

    [self presentControllerStartPage:ctrl.pageNumber animated:NO];
}

@end
