//
//  ReaderMainViewController.m
//  Reader
//
//  Created by Suleyman Melikoglu on 1/20/13.
//
//

#import "ReaderMainViewController.h"
#import "ReaderPageViewController.h"

@interface ReaderMainViewController ()
@end

@implementation ReaderMainViewController
@synthesize document, pageViewController;

- (id)initWithDocument:(ReaderDocument *)aDocument startPage:(NSInteger)startPage
{
    self = [super init];
    if (self) {
        document = aDocument;
        pageViewController = [ReaderPageViewController readerPageViewControllerWithDocument:aDocument
                                                                              displayOption:ReaderDisplayOptionDoublePageOnLandscape startPage:startPage];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [pageViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:pageViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
