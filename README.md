DJRouter
=====
A simple Controller Router.Inspired by [HHRouter](https://github.com/Huohua/HHRouter).

## Usage

### Warm Up

Register route patterns to viewController. Better in AppDelegate.

```objective-c
[[DJRouter shared] registerRouter:Router_Second toControllerClass:[SecondViewController class]];
```

### Exciting Time
Get viewController instance from route.

```objective-c
UIViewController *controller = [[DJRouter shared] matchController:Router_Second];
or Storyboard、xib:
UIViewController *controller = [[DJRouter shared] matchControllerWithStoryboardName:kMainStoryboard route:Router_Second];
```
### Pass Params

Pass parameter is also supported, which will make things VERY flexible.

```objective-c
UIViewController *controller = [[DJRouter shared] matchController:Router_Second params:@{@"a":@"a",@"b":@"b"}];
```

### Callback

Support controller reverse parameter callback.

```objective-c
[DJRouter shared].callback = ^(NSString * _Nonnull route, id  _Nullable params) {
     NSLog(@"route:%@, params:%@", route, params);
};
```

## License
DJRouter is available under the MIT license.


