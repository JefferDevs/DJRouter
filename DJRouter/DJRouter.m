//
//  DJRouter.m
//  DJRouterDemo
//
//  Created by jdq on 2018/10/30.
//  Copyright © 2018 JefferDevs. All rights reserved.
//

#import "DJRouter.h"
#import <objc/runtime.h>

@interface DJRouter()
@property (nonatomic, strong) NSMutableDictionary *routers;
@end

@implementation DJRouter

+ (instancetype)shared
{
    static DJRouter *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

/**
 * 注册router
 */

- (void)registerRouter:(NSString *)router toControllerClass:(Class)controllerClass
{
    // 缓存router
    BOOL isSaved = [self cacheRouterName:router controllerClass:controllerClass];
    NSAssert(isSaved, @"This router already exist!");
}

/**
 * 匹配查找controller，不带参
 */

- (UIViewController *)matchController:(NSString *)route
{
    return [self baseMatchControllerWithStoryboardName:nil
                                                 route:route
                                                params:nil];
}

- (UIViewController *)matchControllerWithStoryboardName:(NSString * _Nonnull)name
                                                  route:(NSString * _Nonnull)route
{
    return [self baseMatchControllerWithStoryboardName:name
                                                 route:route
                                                params:nil];
}

/**
 * 匹配查找controller，带参
 */

- (UIViewController *)matchController:(NSString *)route params:(NSDictionary *)params
{
    return [self baseMatchControllerWithStoryboardName:nil
                                                 route:route
                                                params:params];
}

- (UIViewController *)matchControllerWithStoryboardName:(NSString * _Nonnull)name
                                                  route:(NSString * _Nonnull)route
                                                 params:(NSDictionary *)params
{
    return [self baseMatchControllerWithStoryboardName:name
                                                 route:route
                                                params:params];
}

#pragma mark - Private

- (NSMutableDictionary *)routers
{
    if (!_routers) {
        _routers = [NSMutableDictionary dictionary];
    }
    return _routers;
}

- (UIViewController *)baseMatchControllerWithStoryboardName:(NSString *)name
                                                      route:(NSString *)route
                                                     params:(NSDictionary *)params
{
    Class controllerClass = self.routers[route];
    if (!controllerClass) {
        NSAssert(nil, @"This router is not exist!");
        return nil;
    }
    // 初始化controller
    UIViewController *controller = nil;
    if (name.length) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        NSString *identifer = NSStringFromClass(controllerClass);
        controller = [storyboard instantiateViewControllerWithIdentifier:identifer];
    }
    else {
        controller = [[controllerClass alloc] init];
    }
    // 设置参数
    if (params.count) {
        if ([controller respondsToSelector:@selector(setParams:)]) {
            [controller setParams:params];
        }
    }
    // 记录当前router
    if ([controller respondsToSelector:@selector(setRoute:)]) {
        [controller setRoute:route];
    }
    return controller;
}

- (BOOL)cacheRouterName:(NSString *)router controllerClass:(Class)controllerClass
{
    BOOL flag = false;
    NSArray *allKeys = self.routers.allKeys;
    for (NSString *key in allKeys) {
        if ([key isEqualToString:router]) {
            flag = true;
            break;
        }
    }
    if (flag) {
        return false;
    }
    [self.routers setObject:controllerClass forKey:router];
    return true;
}

@end

#pragma mark - UIViewController Category

@implementation UIViewController (JDRouter)

// runtime 设置属性

static char kAssociatedRouteObjectKey;
static char kAssociatedParamsObjectKey;

- (void)setRoute:(NSString *)route
{
    objc_setAssociatedObject(self, &kAssociatedRouteObjectKey, route, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setParams:(NSDictionary *)paramsDictionary
{
    objc_setAssociatedObject(self, &kAssociatedParamsObjectKey, paramsDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)route
{
    return objc_getAssociatedObject(self, &kAssociatedRouteObjectKey);
}

- (NSDictionary *)params
{
    return objc_getAssociatedObject(self, &kAssociatedParamsObjectKey);
}

@end
