//
//  LoginController.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class LoginController: BaseController {
    let viewModel = LoginViewModel()
    
    private let carImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginCarImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "drive it"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 0.2
        field.layer.cornerRadius = 20
        field.clipsToBounds = true
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.borderStyle  = .roundedRect
        field.isSecureTextEntry = true
        field.layer.borderWidth = 0.2
        field.layer.cornerRadius = 20
        field.clipsToBounds = true
        field.textAlignment = .center
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func loginButtonTapped() {
        viewModel.configLogin(email: emailField.text ?? "", password: passwordField.text ?? "")
    }
    
    override func configUI() {
        view.backgroundColor = .systemBlue
        [loginImage, carImage, topLabel, emailField, passwordField, loginButton].forEach { view.addSubview($0) }
    }
    
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            loginImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImage.widthAnchor.constraint(equalToConstant: 122),
            loginImage.heightAnchor.constraint(equalToConstant: 146),
            
            topLabel.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 16),
            topLabel.centerXAnchor.constraint(equalTo: loginImage.centerXAnchor),
            
            carImage.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 24),
            carImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            carImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            carImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            emailField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 48),
            emailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            emailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalTo: emailField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 28),
            loginButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: passwordField.heightAnchor)
        ])
    }
}
