#import <React/RCTViewManager.h>
#import "RNCPagerViewComponentView.h"
@interface RNCPagerViewManager : RCTViewManager
@end

@implementation RNCPagerViewManager

RCT_EXPORT_MODULE(RNCViewPager)
RCT_EXPORT_VIEW_PROPERTY(pageIndex, NSInteger)

- (UIView *)view
{
  return [[RNCPagerViewComponentView alloc] init];
}

@end
