//
//  ViewController.swift
//  Keyboard
//
//  Created by Adriana González Martínez on 10/24/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var greetingsLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print(keyboardSize.height)
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }

    
    func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        greetingsLabel.text = textField.text
        return true
    }
}

