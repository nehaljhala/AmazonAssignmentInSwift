//
//  ViewController.swift
//  AmazonAppAssignment
//
//  Created by Nehal Jhala on 10/2/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, UIScrollViewDelegate, UIWebViewDelegate, WKUIDelegate, UITabBarDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tabBar: UITabBar!
    var homeTabBarItem: UITabBarItem!
    var cartTabBarItem: UITabBarItem!
    
    // Constants:
    let homeURL = URL(string: "https://www.amazon.com")!
    let cartURL = URL(string: "https://www.amazon.com/cart")!
    var linkTitles: [String] = ["95037", "Whole Foods", "Groceries", "Pharmacy", "Alexa", "Medicine", "Prime"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar?.delegate = self
        tabBar?.delegate = self
        horizontalScrollView.delegate = self
        webView.scrollView.delegate = self
        view.addSubview(horizontalScrollView!)
        setUpScrollView()
        configureStackViewWithLinks()
        view.addSubview(webView)
        configureTabbar()
        loadWebView()
        tabBar.selectedItem = tabBar.items![0]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // configure scroll view:
    func setUpScrollView(){
        horizontalScrollView!.backgroundColor = .clear
        horizontalScrollView.showsVerticalScrollIndicator = false
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        horizontalScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        horizontalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        horizontalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // configure stack with links with action:
    func configureStackViewWithLinks() {
        let stackView = UIStackView()
        horizontalScrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor, constant:10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor,constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor, constant: 5).isActive = true
        stackView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor).isActive = true
        
        // create link buttons
        for title in linkTitles {
            let button = UIButton()
            button.backgroundColor = .white
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14)
            button.addTarget(self,action: #selector(buttonAction(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    // segue to next view when link tapped:
    @objc func buttonAction(_ button: UIButton) {
        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "goToWebView") as? WebViewController else {
            print("Could not instantiate view controller")
            return
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    // load the webview with the url:
    func loadWebView() {
        webView.uiDelegate = self
        webView.load(URLRequest(url: homeURL))
        tabBarController?.selectedIndex = 0
    }
    
    // scrollview delegate method for animation:
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            tabBar.isHidden = true
            horizontalScrollView.isHidden = true
        } else {
            tabBar.isHidden = false
            horizontalScrollView.isHidden = false
        }
    }
    
    // tabbar item configuration and delegate method to load different urls for each tab:
    func configureTabbar() {
        let homeTab = UITabBarItem(title: "Home Tab", image: UIImage(systemName: "house"), tag: 0)
        let cartTab = UITabBarItem(title: "Cart Tab", image: UIImage(systemName: "cart"), tag: 1)
        tabBar.items = [homeTab, cartTab]
    }
    
    @objc func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            // load amazon home url
            webView.load(URLRequest(url: homeURL))
        case 1:
            // load amazon cart url
            webView.load(URLRequest(url: cartURL))
        default:
            break
        }
    }
    
    // searchBar:
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchBar.resignFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
}

