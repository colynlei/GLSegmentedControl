//
//  Macro.h
//  HuobiPoolDapp
//
//  Created by 雷国林 on 2018/11/16.
//  Copyright © 2018 李辉. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//获取APP版本号
#define kAppVersion \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAppBuildVersion \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//判断是iphone几
#define kIsIphone4     (kScreenWidth==320&&kScreenHeight==480)
#define kIsIphone5     (kScreenWidth==320&&kScreenHeight==568)
#define kIsIphone6     (kScreenWidth==375&&kScreenHeight==667)
#define kIsIphone6Plus (kScreenWidth==414&&kScreenHeight==736)
#define kIsIphone7     kIsIphone6
#define kIsIphone7Plus kIsIphone6Plus
#define kIsIphone8     kIsIphone6
#define kIsIphone8Plus kIsIphone6Plus
#define kIsIphoneX     [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f && (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//状态栏、导航条、导航栏
#define kStatusBarHeight kApplication.statusBarFrame.size.height /* 20 */
#define kTopBarSafeHeight (CGFloat)(kIsIphoneX?(44):(0)) // 顶部安全区域远离高度
#define kBottomSafeHeight (CGFloat)(kIsIphoneX?(34):(0)) // 底部安全区域远离高度
#define kTopBarDifHeight (CGFloat)(kIsIphoneX?(44):(20))  // iPhoneX的状态栏高度差值
#define kNavbarHeight (CGFloat)(44+kTopBarDifHeight)   // 导航条高度
#define kTabbarHeight (CGFloat)(49+kBottomSafeHeight)    //分栏高度

#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale, [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)
#define kScreenWidth kScreenSize.width
#define kScreenHeight kScreenSize.height
#define kScreenScale kScreenWidth/375
#define kScreenFrame CGRectMake(0, 0, kScreenWidth, kScreenHeight)

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kWindow             [[UIApplication sharedApplication].delegate window]
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kFileManager        [NSFileManager defaultManager]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kBundle             [NSBundle mainBundle]
//颜色
#define kColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define kColorRGB(r, g, b) kColorRGBA(r, g, b, 1.0f)
#define kColorRandomAlpha(alpha) \
kColorRGBA(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256),alpha)
#define kColorRandom kColorRandomAlpha(1.0f)
#define kColorWithHexAndAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define kColorWithHex(rgbValue) kColorWithHexAndAlpha(rgbValue,1.0f)

//弱引用
#define kWeakSelf(type)   __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
//字体大小及字重
#define kFont(size)             [UIFont systemFontOfSize:size]
//#define kFont_Bold(size)        [UIFont boldSystemFontOfSize:size]
#define kFont_UltraLight(size)  [UIFont systemFontOfSize:size weight:UIFontWeightUltraLight]
#define kFont_Thin(size)        [UIFont systemFontOfSize:size weight:UIFontWeightThin]
#define kFont_Light(size)       [UIFont systemFontOfSize:size weight:UIFontWeightLight]
#define kFont_Regular(size)     [UIFont systemFontOfSize:size weight:UIFontWeightRegular]
#define kFont_Medium(size)      [UIFont systemFontOfSize:size weight:UIFontWeightMedium]
#define kFont_Semibold(size)    [UIFont systemFontOfSize:size weight:UIFontWeightSemibold]
#define kFont_Bold(size)        [UIFont systemFontOfSize:size weight:UIFontWeightBold]
#define kFont_Heavy(size)       [UIFont systemFontOfSize:size weight:UIFontWeightHeavy]
#define kFont_Black(size)       [UIFont systemFontOfSize:size weight:UIFontWeightBlack]

//图片
#define kImage(name) [UIImage imageNamed:name]
//随机数 [from,to] //包含from 和 to
#define kRandomInt(from,to) (NSInteger)(from + (arc4random() % (to - from + 1)))

#if DEBUG
#define DLog(...) fprintf(stderr,"[文件：%s]\n[时间：%s]\n[行号：%d]\n%s\n\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __TIME__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define DLog(...)
#endif

#endif /* Macro_h */
