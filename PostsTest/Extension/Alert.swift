//
//  Alert.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import UIKit

extension UIViewController {
    
    func alertResult(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertOK)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func alertError(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertOK)
        
        present(alertController, animated: true, completion: nil)
    }
}
