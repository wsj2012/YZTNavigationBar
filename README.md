# YZTNavigationBar
定制UINavigationBar样式，可全局统一设置默认样式，在各页面灵活定制自己的样式。

## Setup Instructions

To integrate YZTNavigationBar into your Xcode project using CocoaPods, specify it in your Podfile:

pod 'YZTNavigationBar', and in your code add import YZTNavigationBar.

## Manually

Just add YZTNavigationBar folder to your project.

## Basic Examples


* 1、Normal style

![ScreenShot](https://github.com/wsj2012/YZTNavigationBar/blob/master/System.png?raw=true)


```
func setNavbarAppearance() {
        // 导航栏颜色
        navBarBarTintColor = .white
        // 导航栏透明度
        navBarBackgroundAlpha = 1
        // 导航栏两边按钮颜色
        navBarTintColor = .black
        // 导航栏上标题颜色
        navBarTitleColor = .black
        // 导航栏底部分割线是否隐藏
        navBarShadowImageHidden = true;
        // 状态栏是 default 还是 lightContent
        statusBarStyle = .default
    }


```

* 2、Custom Style

![baidu](https://github.com/wsj2012/Flop/blob/master/drop.gif) 