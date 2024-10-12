//
//  MainViewController.swift
//  AmazonAppAssignment
//
//  Created by Nehal Jhala on 10/9/24.
//
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UIScrollViewDelegate, UIWebViewDelegate, WKUIDelegate, UITabBarDelegate, WKNavigationDelegate>

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

@implementation ViewController
    
    - (const NSURL *)homeURL {
        return [NSURL URLWithString:@"https://www.amazon.com"];
    }
    
    - (const NSURL *)cartURL {
        return [NSURL URLWithString:@"https://www.amazon.com/cart"];
    }
    
    - (NSArray *)linkTitles {
        return @[@"95037", @"Whole Foods", @"Groceries", @"Pharmacy", @"Alexa", @"Medicine", @"Prime"];
    }
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        self.searchBar.delegate = self;
        self.tabBar.delegate = self;
        self.horizontalScrollView.delegate = self;
        self.webView.scrollView.delegate = self;
        
        [self.view addSubview:self.horizontalScrollView];
        [self setUpScrollView];
        [self configureStackViewWithLinks];
        [self.view addSubview:self.webView];
        [self configureTabbar];
        [self loadWebView];
        self.tabBar.selectedItem = self.tabBar.items[0];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
        tapGesture.cancelsTouchesInView
        = NO;
        [self.view addGestureRecognizer:tapGesture];
    }
    
    - (void)viewDidLayoutSubviews {
        [super viewDidLayoutSubviews];
        
    }
    
    // configure scroll view:
    - (void)setUpScrollView {
        self.horizontalScrollView.backgroundColor = [UIColor clearColor];
        self.horizontalScrollView.showsVerticalScrollIndicator = NO;
        self.horizontalScrollView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
         
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:50.0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
         
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.searchBar
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
         
                                      constant:0.0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.horizontalScrollView
         
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
         
        ];
        
    }

@end
