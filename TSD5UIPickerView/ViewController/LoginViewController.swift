//
//  ViewController.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 19.01.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    let birthdayLabel = UILabel()
    let signInLabel = UILabel()
    
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    
    let faceIdLabel = UILabel()
    let faceIdSwitch = UISwitch()
    
    let signInButton = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        // MARK: Set layout constraint
        
        NSLayoutConstraint.activate([
            
            // MARK: Set birthdayLabel constraints
            
            birthdayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            birthdayLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Set signInLabel constraints
            
            signInLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 80),
            signInLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInLabel.heightAnchor.constraint(equalToConstant: 36),
            
            // MARK: Set emailLabel constraints
            
            emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 14),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
            
            // MARK: Set emailTextField constraints
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 0),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // MARK: Set passwordLabel constraints
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passwordLabel.heightAnchor.constraint(equalToConstant: 24),
            
            // MARK: Set passwordTextField constraints
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            // MARK: Set signInButton constraints
            
            signInButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 100),
            signInButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: -30),
            signInButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: Setup companyLabel
    
    private func setupBirthdayLabel() {
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.text = "Birthday Reminder"
        birthdayLabel.adjustsFontSizeToFitWidth = true
        birthdayLabel.textColor = .systemTeal
        birthdayLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        view.addSubview(birthdayLabel)
    }
    
    // MARK: Setup signInLabel
    
    private func setupSignInLabel() {
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        signInLabel.text = "Sign In"
        signInLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        view.addSubview(signInLabel)
    }
    
    // MARK: Setup emailLabel
    
    private func setupEmailLabel() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        emailLabel.textColor = .systemTeal
        
        view.addSubview(emailLabel)
    }
    
    // MARK: Setup emailTextField
    
    private func setupEmailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.text = "example@email.com"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        emailTextField.borderStyle = .none
        
        view.addSubview(emailTextField)
    }
    
    // MARK: Setup passwordLabel
    
    private func setupPasswordLabel() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        passwordLabel.textColor = .systemTeal
        
        view.addSubview(passwordLabel)
    }
    
    // MARK: Setup passwordTextField
    
    private func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.text = "strongPassword"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        passwordTextField.borderStyle = .none
        
        view.addSubview(passwordTextField)
    }
    
    // MARK: Setup faceIdLabel
    
    private func setupFaceIdLabel() {
        faceIdLabel.translatesAutoresizingMaskIntoConstraints = false
        faceIdLabel.text = "Sign In on Face Id"
        faceIdLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    // MARK: Setup signInButton
    
    private func setupSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .systemTeal
        signInButton.tintColor = .white
        signInButton.layer.cornerRadius = 15
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        view.addSubview(signInButton)
    }
    
    // MARK: Setup View User Interface
    // Invoke all functions that configure UI.
    
    private func setupUI() {
        setupBirthdayLabel()
        setupSignInLabel()
        setupEmailLabel()
        setupEmailTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupSignInButton()
    }
    
    //
    // MARK:- Controller Section
    //
    
    // MARK: FUNCTION SignInButtonTapped
    // Try to create User example. If person is valid then transit to OrderView else PopUp Alert.
    
    @objc private func signInButtonTapped() {
        
        let user =
            User(
                email: emailTextField.text ?? "",
                password: passwordTextField.text ?? "",
                birthdayPersons: .init()
            )
                
        if validatePerson(user) {
            navigationController?.pushViewController(BirthdayViewController(), animated: true)
        } else {
            let alertController = UIAlertController(title: "Validation Error", message: "Your email or password are wrong", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK: FUNCTION validateUser
    // Check user entered email and password and return Bool.
    
    private func validatePerson(_ user: User) -> Bool {
        
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        let emailValidation = testEmail.evaluate(with: user.email)
            
        let passwordValidation = !user.password.isEmpty
        
        return emailValidation && passwordValidation
    }
}

