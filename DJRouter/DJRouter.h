//
//  DJRouter.h
//  DJRouterDemo
//
//  Created by jdq on 2018/10/30.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ReturnBlock)(NSString *route, __nullable id params);

@interface DJRouter : NSObject

@property (nonatomic, copy) ReturnBlock callback;

+ (instancetype)shared;

/**
 * 注册router
 */
- (void)registerRouter:(NSString *)router toControllerClass:(Class)controllerClass;
/**
 * 匹配查找controller
 */
- (UIViewController *)matchController:(NSString *)route;
- (UIViewController *)matchController:(NSString *)route params:(NSDictionary *)params;
/**
 * 匹配查找controller (使用Storyboard，xib)
 * identifier默认为controller名
 */
- (UIViewController *)matchControllerWithStoryboardName:(NSString * _Nonnull)name
                                                  route:(NSString * _Nonnull)route;
- (UIViewController *)matchControllerWithStoryboardName:(NSString * _Nonnull)name
                                                  route:(NSString * _Nonnull)route
                                                 params:(NSDictionary *)params;

@end

@interface UIViewController (JDRouter)

@property (nonatomic, copy) NSString *route;
@property (nonatomic, strong) NSDictionary *params;

@end

NS_ASSUME_NONNULL_END
