//
//  RNCPagerViewComponentView.m
//  PagerView
//
//  Copyright © 2021 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNCPagerViewComponentView.h"

#import <react/renderer/components/PagerView/ComponentDescriptors.h>
#import <react/renderer/components/PagerView/EventEmitters.h>
#import <react/renderer/components/PagerView/Props.h>
#import <react/renderer/components/PagerView/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"


using namespace facebook::react;

@interface RNCPagerViewComponentView () <RCTRNCViewPagerViewProtocol>
@end

@implementation RNCPagerViewComponentView {

}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RNCViewPagerProps>();
    _props = defaultProps;
    _nativeChildrenViewControllers = [[NSMutableArray alloc] init];
    _scrollEnabled = YES;
    _pageMargin = 0;
    _currentIndex = 0;
    _nativePageViewController = [[UIPageViewController alloc]
                                 initWithTransitionStyle: UIPageViewControllerTransitionStyleScroll
                                 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                 options:nil];
    _nativePageViewController.view.frame = frame;
  }
  return self;
}

- (void)mountChildComponentView:(UIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
//    [super mountChildComponentView:childComponentView index:index];
    NSLog(@"mountChildComponentView %ld", (long)index);
    //UIViewController *wrapper = [[UIViewController alloc] initWithView:childComponentView];
    //_nativeChildrenViewControllers addObject:<#(nonnull UIViewController *)#>
}

- (void)unmountChildComponentView:(UIView<RCTComponentViewProtocol> *)childComponentView index:(NSInteger)index {
    [super unmountChildComponentView:childComponentView index:index];
    NSLog(@"unmountChildComponentView");
}

- (void)updateProps:(const facebook::react::Props::Shared &)props oldProps:(const facebook::react::Props::Shared &)oldProps {
    const auto &oldScreenProps = *std::static_pointer_cast<const RNCViewPagerProps>(_props);
    const auto &newScreenProps = *std::static_pointer_cast<const RNCViewPagerProps>(props);
    [super updateProps:props oldProps:oldProps];
}

- (void)updateState:(facebook::react::State::Shared const &)state
           oldState:(facebook::react::State::Shared const &)oldState {
    [super updateState: state oldState:oldState];
    NSLog(@"updateState");
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RNCViewPagerComponentDescriptor>();
}


@end

Class<RCTComponentViewProtocol> RNCViewPagerCls(void)
{
  return RNCPagerViewComponentView.class;
}
