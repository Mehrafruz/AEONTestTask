//
//  SignInViewController.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {
    private let output: SignInViewOutput
    
    private var scrollView = UIScrollView()
    private var backgroundImageView = UIImageView()
    private var loginLabel = UILabel()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private let customLine0 = UITableViewCell()
    private let customLine1 = UITableViewCell()
    private var emailImageView = UIImageView()
    private var lockImageView = UIImageView()
    private var signInButton = UIButton()
    
    init(output: SignInViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 900)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifikation()
        setup()
        
    }
    
    deinit {
        removeForKeyboardNotifikation()
    }
    
    func registerForKeyboardNotifikation(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeForKeyboardNotifikation(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height/4)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    
    func setup(){
   
        setupLabel(label: loginLabel, text: "Login", fontSize: 40)
        setupImageView(imageView: emailImageView, imageNamed: "envelope.fill")
        setupImageView(imageView: lockImageView, imageNamed: "lock.fill")
        
        setupTextField(textField: emailTextField, placeholder: "Email")
        setupTextField(textField: passwordTextField, placeholder: "Password")
        passwordTextField.isSecureTextEntry = true
        
        setupButton(button: signInButton, title: "SIGN IN", color: ColorPalette.green, textColor: UIColor.white)
        signInButton.addTarget(self, action: #selector(didClickedSignInButton), for: .touchUpInside)
        
        backgroundImageView.image = UIImage(named: "bgImage")
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(scrollView)
        
        [customLine0, customLine1].forEach {
            ($0).backgroundColor =  ColorPalette.gray
        }
        
        [backgroundImageView, loginLabel, emailTextField, passwordTextField, emailImageView, lockImageView, signInButton, customLine0, customLine1].forEach {
            scrollView.addSubview($0)
        }
        addConstraints()
        
    }
    
    func addConstraints(){
        
        [scrollView, backgroundImageView, loginLabel,emailTextField, passwordTextField,emailImageView, lockImageView, signInButton, customLine0, customLine1].forEach {
            ($0).translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.widthAnchor.constraint(equalToConstant: 250),
            loginLabel.heightAnchor.constraint(equalToConstant: 50),
            loginLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -220)
        ])
        
        NSLayoutConstraint.activate([
            emailImageView.widthAnchor.constraint(equalToConstant: 30),
            emailImageView.heightAnchor.constraint(equalToConstant: 25),
            emailImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: -125),
            emailImageView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -132)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -130)
        ])
        
        NSLayoutConstraint.activate([
            customLine0.widthAnchor.constraint(equalToConstant: 300),
            customLine0.heightAnchor.constraint(equalToConstant: 0.5),
            customLine0.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            customLine0.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -114)
        ])
        
        NSLayoutConstraint.activate([
            lockImageView.widthAnchor.constraint(equalToConstant: 30),
            lockImageView.heightAnchor.constraint(equalToConstant: 30),
            lockImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: -125),
            lockImageView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -71)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            customLine1.widthAnchor.constraint(equalToConstant: 300),
            customLine1.heightAnchor.constraint(equalToConstant: 0.5),
            customLine1.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            customLine1.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: -54)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.widthAnchor.constraint(equalToConstant: 150),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor, constant: 50)
        ])
        
    }
    
    func setupLabel(label: UILabel, text: String, fontSize: CGFloat){
        label.font = UIFont(name: "POEVeticaVanta", size: fontSize)
        label.textColor = ColorPalette.black
        label.text = text
        label.textAlignment = .center
    }
    
    func setupImageView(imageView: UIImageView, imageNamed: String){
        imageView.image = UIImage(systemName: imageNamed)
        imageView.tintColor = ColorPalette.green
    }
    
    func setupTextField(textField: UITextField, placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes:[NSAttributedString.Key.foregroundColor: ColorPalette.gray])
        textField.font = UIFont(name: "POEVeticaVanta", size: 16)
        textField.textColor = ColorPalette.black
        textField.backgroundColor = UIColor.clear
    }
    
    func setupButton(button: UIButton, title: String, color: UIColor, textColor: UIColor){
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitleColor(textColor, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name: "POEVeticaVanta", size: 20)
        button.backgroundColor = color
        button.layer.zPosition = 1.5
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.6
        button.layer.masksToBounds = false
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func showAlert(reason: String){
        let title = "Error"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
    
    @objc
    func didClickedSignInButton() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        let reason = "Fill in all the fields"
        guard let email = emailTextField.text, email != "" else{
            print ("emailTextField is empty")
            showAlert(reason: reason)
            return
        }
        guard let password = passwordTextField.text, password != "" else{
            print ("passwordTextField is empty")
            showAlert(reason: reason)
            return
        }
        
        signInButton.pulsate()
        output.auth(email: email, pass: password)
    }
    
}

extension SignInViewController: UITextFieldDelegate, AlertDisplayer{

    
}

extension SignInViewController: SignInViewInput {
}
