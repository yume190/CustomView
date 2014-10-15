//
//  FiveSquare.m
//  CustomViewTest
//
//  Created by Yume on 2014/10/8.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "FiveSquare.h"

@interface FiveSquare ()
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation FiveSquare

////-(UITraitCollection *)traitCollection
////-(id<UIViewControllerTransitionCoordinator>)transitionCoordinator
////-(void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL))completion
////-(id<UIViewControllerTransitioningDelegate>)transitioningDelegate
//-(UITraitCollection *)traitCollection{
//    UITraitCollection *x = [super traitCollection];
////    UITraitCollection *a = [UITraitCollection traitCollectionWithDisplayScale:3];
////    UITraitCollection *b = [UITraitCollection traitCollectionWithUserInterfaceIdiom:UIUserInterfaceIdiomPhone];
////    UITraitCollection *c = [UITraitCollection traitCollectionWithVerticalSizeClass:UIUserInterfaceSizeClassCompact];
////    UITraitCollection *d = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
////    UITraitCollection *e = [UITraitCollection traitCollectionWithTraitsFromCollections:@[a,b,c,d]];
//    NSArray *collections = @[TRAIT_COLLECTION_DISPLAY_SCALE_3,
//                             TRAIT_COLLECTION_IDIOM_PHONE,
//                             TRAIT_COLLECTION_WIDTH_REGULAR,
//                             TRAIT_COLLECTION_HEIGHT_COMPACT];
//    UITraitCollection *result = TRAIT_COLLECTIONS(collections);
//    return result;
//
////    return x;
//}

//-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
//    previousTraitCollection;
//}

//-(void)updateConstraints{
//    //    [super updateConstraints];
//    NSDictionary *views = @{ @"view" : self.view };
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views]];
//    [super updateConstraints];
//}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSDictionary *views = @{ @"view" : self.view };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views]];
}
-(void)setup{
    [super setup];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.view];
}

-(void)viewLiveRendering{
    [super viewLiveRendering];
    self.view.backgroundColor = [UIColor clearColor];
}

@end
