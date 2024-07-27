//
//  WebViewViewController.swift
//  ImageFeed
//
//  Created by Mark Balikoti on 27.07.2024.
//

import UIKit
import WebKit

final class WebViewViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet private var webView: WKWebView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackButton()
    }
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
    }
    
    // MARK: - Private Methods
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_button")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "ypBlack")
    }
    
    
    
    
}
