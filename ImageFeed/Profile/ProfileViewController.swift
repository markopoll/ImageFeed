//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Mark Balikoti on 21.07.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - IB Outlets
    // MARK: - Public Properties
    // MARK: - Private Properties
    private var avatarImageView: UIImageView?
    private var nameLabel: UILabel?
    private var loginNameLabel: UILabel?
    private var descriptionLabel: UILabel?
    private var logoutButton: UIButton?
    
    // MARK: - Initializers
    // MARK: - IB Actions
    @IBAction private func didTapLogoutButton(_ sender: Any) { }
    
    // MARK: - Public Methods
    // MARK: - Private Methods
    private func addNameLabel() {
        let nameLabel = UILabel()
        view.addSubview(nameLabel)
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        guard let avatarImageView = self.avatarImageView else {
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
            self.nameLabel = nameLabel
            return
        }
        nameLabel.firstBaselineAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 26).isActive = true
        self.nameLabel = nameLabel
    }
    
    private func addLoginNameLabel() {
        let loginNameLabel = UILabel()
        view.addSubview(loginNameLabel)
        loginNameLabel.text = "@ekaterina_nov"
        loginNameLabel.textColor = UIColor(red: 0.68, green: 0.69, blue: 0.71, alpha: 1.00)
        loginNameLabel.font = UIFont.systemFont(ofSize: 13)
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        loginNameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        loginNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        guard let name = self.nameLabel else {
            loginNameLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136).isActive = true
            self.loginNameLabel = loginNameLabel
            return
        }
        loginNameLabel.topAnchor.constraint(
            equalTo: name.lastBaselineAnchor, constant: 8).isActive = true
        self.loginNameLabel = loginNameLabel
    }
    
    private func addDescriptionLabel() {
        let descriptionLabel = UILabel()
        view.addSubview(descriptionLabel)
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        guard let loginNameLabel = self.loginNameLabel else {
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 162).isActive = true
            self.descriptionLabel = descriptionLabel
            return
        }
        descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8).isActive = true
        self.descriptionLabel = descriptionLabel
    }
    
    private func addLogoutButton() {
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "logout_button")!,
            target: self,
            action: nil)
        view.addSubview(logoutButton)
        logoutButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        logoutButton.tintColor = UIColor(red: 0.96, green: 0.42, blue: 0.42, alpha: 1.00)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6).isActive = true
        guard let avatarImageView = self.avatarImageView else {
            logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
            self.logoutButton = logoutButton
            return
        }
        logoutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        self.logoutButton = logoutButton
    }
    
    private func addAvatarImageView() {
        let avatarImageView = UIImageView(image: UIImage(named: "avatar"))
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        self.avatarImageView = avatarImageView
    }
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addNameLabel()
        addLoginNameLabel()
        addDescriptionLabel()
        addLogoutButton()
        addAvatarImageView()
    }
}
