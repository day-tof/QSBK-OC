//
//  CustomTabBarController.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/8.


#import "CustomTabBarController.h"
#import "QiushiViewController.h"
#import "MyselfViewController.h"
#import "FindViewController.h"


@interface CustomTabBarController ()

- (void)_setup;//设置TabBarController
- (UINavigationController *)_navigationControllerWithClass:(Class)class;//根据指定的视图控制器类型创建对象以及导航控制器


@end

@implementation CustomTabBarController

-(UINavigationController *)_navigationControllerWithClass:(Class)class {
    UIViewController *aViewController = [[class alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:aViewController];
    [aViewController release];
    return [navigation autorelease];
}


-(void)_setup {
    NSArray *imageName = @[@"icon_main",@"main_tab_discovery",@"icon_me"];
    NSArray *titles = @[@"糗事",@"发现",@"我"];
    NSArray *classNames = @[@"QiushiViewController",@"FindViewController",@"MyselfViewController"];
    NSMutableArray *viewController = [NSMutableArray array];
    for (int i = 0; i < classNames.count; i++) {
        UINavigationController *aNavi = [self _navigationControllerWithClass:NSClassFromString(classNames[i])];
        aNavi.tabBarItem = [[[UITabBarItem alloc] initWithTitle:titles[i] image:[[UIImage imageNamed:imageName[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[imageName[i] stringByAppendingString:@"_active"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]] autorelease];
        [viewController addObject:aNavi];
    }
    self.viewControllers = viewController;
    self.tabBar.tintColor = [UIColor orangeColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
