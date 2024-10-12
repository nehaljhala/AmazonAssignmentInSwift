//
//  ViewController.h
//  AmazonAppAssignment
//
//  Created by Nehal Jhala on 10/9/24.
//


#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface MainViewController : UIViewController <UISearchBarDelegate, UIScrollViewDelegate, UIWebViewDelegate, WKUIDelegate, UITabBarDelegate, WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIScrollView *horizontalScrollView;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (nonatomic, strong) UITabBarItem *homeTabBarItem;
@property (nonatomic, strong) UITabBarItem *cartTabBarItem;

// Constants:
- (const NSURL *)homeURL;
- (const NSURL *)cartURL;
@property (nonatomic, strong) NSArray *linkTitles;

- (void)viewDidLoad;
- (void)viewDidLayoutSubviews;

// configure scroll view:
- (void)setUpScrollView;

// configure stack with links with action:
- (void)configureStackViewWithLinks;

// segue to next view when link tapped:
- (IBAction)buttonAction:(UIButton *)button;

// load the webview with the url:
- (void)loadWebView;

// scrollview delegate method for animation:
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

// tabbar item configuration and delegate method to load different urls for each tab:
- (void)configureTabbar;
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;

// searchBar:
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

- (IBAction)dismissKeyboard;

@end


