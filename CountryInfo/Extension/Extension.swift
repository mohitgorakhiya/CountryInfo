//
//  Extension.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func showAlert(title:String = Constant.alertTitle ,msg:String, completion:(()->())?) {
        
        let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let action = UIAlertAction(title: Constant.alertOk, style: .cancel) { (action) in
            if completion != nil {
                completion!()
            }
        }
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
}
