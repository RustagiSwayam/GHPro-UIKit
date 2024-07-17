//
//  SearchViewController.swift
//  GHPro
//
//  Created by Swayam Rustagi on 16/07/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemPink, title: "Lookup Followers")
    let myName = UILabel()
    
    //computed property for seeing if entered text is not empty/0
    var isUsernameEntered: Bool{
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() { //This is called only when view appears for the first time.
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCTAButton()
        createDismissKeyboardGesture()
    }
    
    //the reason of hiding the navigation bar in viewWillAppear is, when we return from the second screen,
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80), //give height of 80 from the top
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //centers it in horizontal layout
            logoImageView.heightAnchor.constraint(equalToConstant: 200), //setting height
            logoImageView.widthAnchor.constraint(equalToConstant: 200)  //setting width

        ])
    }
    
    func configureTextField(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    func configureCTAButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), //50px from the bottom
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func createDismissKeyboardGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap) //the whole view recognizes a gesture passed into addGestureRecognizer modifier
    }
    
    //using @objc conforms it to be used into #selector
    @objc func pushFollowerListViewController(){
        guard isUsernameEntered else { 
            print("No username was entered")
            return } //doesnt execute the function, if isUsernameEntered is false
        let followerListViewController = FollowerListViewController()
        followerListViewController.username = usernameTextField.text
        followerListViewController.title = usernameTextField.text
        navigationController?.pushViewController(followerListViewController, animated: true)
    }
    
    
}

extension SearchViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       pushFollowerListViewController()
       return true
    }
    
}
