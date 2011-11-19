//
//  UIGridView.h
//  Miso
//
//  Created by Joshua Wu on 10/11/11.
//  Copyright 2011 Miso. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIGridViewDataSource;
@interface UIGridView : UIView {
    NSMutableArray *_views;
    id<UIGridViewDataSource> _dataSource;
}

@property (nonatomic, assign) id<UIGridViewDataSource> dataSource;

- (void)reloadData;

@end

@protocol UIGridViewDataSource <NSObject>

- (NSInteger)numberOfColumnsInGridView:(UIGridView *)gridView;
- (NSInteger)numberOfViewsInGridView:(UIGridView *)gridView;
- (UIView *)gridView:(UIGridView *)gridView viewForIndex:(NSInteger)index;

@end