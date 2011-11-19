//
//  UIGridView.m
//  Miso
//
//  Created by Joshua Wu on 10/11/11.
//  Copyright 2011 Miso. All rights reserved.
//

#import "UIGridView.h"


@implementation UIGridView
@synthesize dataSource=_dataSource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _views = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)dealloc {
    [_views release];
    [super dealloc];
}

#pragma mark - Public Methods

- (void)reloadData {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger numViews = [_dataSource numberOfViewsInGridView:self];
    
    if (numViews == 0) {
        return;
    }
    
    NSInteger numColumns = [_dataSource numberOfColumnsInGridView:self];
    NSInteger numRows = numViews % numColumns == 0 ? (numViews / numColumns) : (numViews / numColumns) + 1;
    
    int xPadding = 5;
    int yPadding = 5;
    
    int blockWidth = (self.frame.size.width-(numColumns-1)*xPadding)/numColumns;
    int blockHeight = (self.frame.size.height-(numRows-1)*yPadding)/numRows;

    
    for (int i = 0; i < numViews; i++) {
        UIView *view = [_dataSource gridView:self viewForIndex:i];
        int currentCol = i % numColumns;
        int currentRow = i / numColumns;
        
        view.frame = CGRectMake(floorf(currentCol * blockWidth + currentCol*xPadding), floorf(currentRow * blockHeight + currentRow*yPadding), view.frame.size.width, view.frame.size.height);
        [self addSubview:view];
    }
}

@end
