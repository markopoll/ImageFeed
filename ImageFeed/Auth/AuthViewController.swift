//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Mark Balikoti on 27.07.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: AuthViewControllerDelegate?
    
    // MARK: - Private Properties
    
    private let showWebViewSegueIdentifier = "ShowWebView"
    private let tokenStorage = OAuth2TokenStorage.shared
    private let OAuthService = OAuth2Service.shared
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Overrides Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showWebViewSegueIdentifier {
            guard
                let webViewViewController = segue.destination as? WebViewViewController
            else { fatalError("Failed to prepare for \(showWebViewSegueIdentifier)") }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    // MARK: - Private Methods
    
    private func switchToTabBarController() {
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid window configuration")
            return
        }
        
        let tabBarController = UIStoryboard(name: "Main", bundle: .main)
            .instantiateViewController(withIdentifier: "TabBarViewController")
        
        window.rootViewController = tabBarController
    }
}

// MARK: - WebViewViewControllerDelegate

extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        navigationController?.popViewController(animated: true)
        
        OAuthService.fetchOAuthToken(code: code) { [self] result in
            switch result {
            case .success(let token):
                print(token)
                delegate?.authViewController(self, didAuthenticateWithCode: code)
                self.switchToTabBarController()
            case .failure(let error):
                print("Error fetching token: \(error)")
            }
        }
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
}
