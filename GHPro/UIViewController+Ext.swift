//
//  UIViewController+Ext.swift
//  GHPro
//
//  Created by Swayam Rustagi on 17/07/24.
//

import UIKit

extension UIViewController{
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async{
            let alertViewController = AlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}
