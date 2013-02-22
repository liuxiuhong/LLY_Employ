//
//  TabbarViewController.m
//  智联_1
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "TabbarViewController.h"

#define ItemWidth 50
#define ItemHeight 49
#define SideMarginX 7
#define SideMarginY 0.5
#define Spacing 14
#define TabBarBackgroundImageViewTag 11111

@implementation TabbarViewController



@synthesize tabBarBackgroundImage   = _tabBarBackgroundImage;
@synthesize unSelectedImageArray    = _unSelectedImageArray;
@synthesize selectedImageArray      = _selectedImageArray;
@synthesize itemBgImageViewArray    = _itemBgImageViewArray;
@synthesize lastSelectedIndex       = _lastSelectedIndex;
@synthesize hiddenIndex             = _hiddenIndex;

-(void)dealloc
{
    self.tabBarBackgroundImage = nil;
    self.unSelectedImageArray = nil;
    self.selectedImageArray = nil;
    self.itemBgImageViewArray = nil;
    [super dealloc];
}
- (id)initWithTabBarBackgroundImage:(UIImage *)barBackgroundImage
               unSelectedImageArray:(NSMutableArray *)unImageArray
                 selectedImageArray:(NSMutableArray *)imageArray {
    
    self = [super init];
    
    if (self)
    {
//        self.tabBarBackgroundImage = barBackgroundImage;
//        self.unSelectedImageArray = unImageArray;
//        self.selectedImageArray = imageArray;
//        self.itemBgImageViewArray = [NSMutableArray array];
//        _lastSelectedIndex = 0;
//        _hiddenIndex = -1;
        
    }
    
    return self;
    
}
- (id)init {
    
    self = [super init];
    
    if (self) {
        
//        self.tabBarBackgroundImage = [UIImage imageNamed:@"menu_bg.png"];
//        
//        NSMutableArray *aunSelectedImageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"menu_paiyou.png"],
//                                                         [UIImage imageNamed:@"menu_chat.png"],
//                                                         [UIImage imageNamed:@"menu_map.png"],
//                                                         [UIImage imageNamed:@"menu_renwu.png"],
//                                                         [UIImage imageNamed:@"menu_huibao.png"], nil];
//        self.unSelectedImageArray = aunSelectedImageArray;
//        [aunSelectedImageArray release];
//        
//        NSMutableArray *aselectedImageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"menu_paiyou_pressed.png"],
//            [UIImage imageNamed:@"menu_chat_pressed.png"],
//            [UIImage imageNamed:@"menu_map_pressed.png"],
//            [UIImage imageNamed:@"menu_renwu_pressed.png"],
//            [UIImage imageNamed:@"menu_huibao_pressed.png"], nil];
//            self.selectedImageArray = aselectedImageArray;
//            [aselectedImageArray release];
//                
//            self.itemBgImageViewArray = [NSMutableArray array];
//            _lastSelectedIndex = 0;
//            _hiddenIndex = -1;
//        
        
        
    }
    
    return self;
    
}
- (void)loadView

{
    
    [super loadView];
    self.tabBarBackgroundImage = [UIImage imageNamed:@"navigationbar_bg.png"];
    NSMutableArray *aunSelectedImageArray = [[NSMutableArray alloc] initWithObjects:
                                             [UIImage imageNamed:@"searchjob_s.png"],
                                             [UIImage imageNamed:@"myzl_s.png"],
                                             [UIImage imageNamed:@"realtime_s.png"],
                                             [UIImage imageNamed:@"searchsalary_s.png"],
                                             [UIImage imageNamed:@"jobguide_s.png"], nil];
    
    self.unSelectedImageArray = aunSelectedImageArray;
    [aunSelectedImageArray release];
    NSMutableArray *aselectedImageArray = [[NSMutableArray alloc] initWithObjects:
                                           [UIImage imageNamed:@"searchjob_s@2x.png"],
                                           [UIImage imageNamed:@"myzl_s@2x.png"],
                                           [UIImage imageNamed:@"realtime_s@2x.png"],
                                           [UIImage imageNamed:@"searchsalary_s@2x.png"],
                                           [UIImage imageNamed:@"jobguide_s@2x.png"], nil];
    self.selectedImageArray = aselectedImageArray;
    [aselectedImageArray release];

    self.itemBgImageViewArray = [NSMutableArray array];
    _lastSelectedIndex = 0;
    _hiddenIndex = -1;
    
}


- (void)setLastSelectedIndex:(int)lastSelectedIndex {
    
    if (_lastSelectedIndex != lastSelectedIndex)
    {
        //将上次的选中效果取消
        UIImageView *lastSelectedImageView = (UIImageView *)[_itemBgImageViewArray objectAtIndex:_lastSelectedIndex];;
        lastSelectedImageView.image = [_unSelectedImageArray objectAtIndex:_lastSelectedIndex];
        _lastSelectedIndex = lastSelectedIndex;
        
    }
    
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    [super setSelectedIndex:selectedIndex];
    //将上次的选中效果取消
    self.lastSelectedIndex = selectedIndex;
    //将本次的选中效果显示
    UIImageView *selectedImageView = (UIImageView *)[_itemBgImageViewArray objectAtIndex:selectedIndex];
    selectedImageView.image = [_selectedImageArray objectAtIndex:selectedIndex];
    
    
    
}


//隐藏某个tabBarItem的图片

- (void)hiddeItemImageView:(int)index {
    
    if (_hiddenIndex != index) {
        _hiddenIndex = index;
        UIImageView *hiddenImageView = (UIImageView *)[_itemBgImageViewArray objectAtIndex:_hiddenIndex];
        hiddenImageView.hidden = YES;
        
    }
    
}


//显示某个tabBarItem的图片

- (void)showItemImageView:(int)index {
    
    if (_hiddenIndex == index) {
        UIImageView *hiddenImageView = (UIImageView *)[_itemBgImageViewArray objectAtIndex:_hiddenIndex];
        hiddenImageView.hidden = NO;
        _hiddenIndex = -1;
        
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *tabBarBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
    tabBarBackgroundImageView.tag = TabBarBackgroundImageViewTag;
    tabBarBackgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    tabBarBackgroundImageView.image = _tabBarBackgroundImage;
    [self.tabBar insertSubview:tabBarBackgroundImageView atIndex:0];
    [tabBarBackgroundImageView release];
    for (int i = 0; i < 5; i++) {
        UIImageView *itemBg  = [[UIImageView alloc] initWithFrame:CGRectMake(SideMarginX +ItemWidth * i + Spacing * i, SideMarginY, ItemWidth, ItemHeight)];
        itemBg.contentMode = UIViewContentModeScaleAspectFit;
        itemBg.image = [_unSelectedImageArray objectAtIndex:i];
        [self.tabBar insertSubview:itemBg atIndex:1];
        [_itemBgImageViewArray addObject:itemBg];
        [itemBg release];
        
    }
    self.selectedIndex = 0;
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
    self.selectedIndex = [tabBar.items indexOfObject:item];
    
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
