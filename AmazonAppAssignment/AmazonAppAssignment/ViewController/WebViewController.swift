//
//  WebViewController.swift
//  AmazonAppAssignment
//
//  Created by Nehal Jhala on 10/2/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var done: UIBarButtonItem!
    
    var urlString: String = "https://www.amazon.com"
    var identifier = "goToWebView"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        loadWebView()
    }
    
    // load webview with url:
    func loadWebView() {
        webView?.uiDelegate = self
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    // go back to previous controller:
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
