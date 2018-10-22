//
//  ProfileViewController.swift
//  Chat
//
//  Created by Mark Yankovsky on 9/21/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profileImageVIew: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextField!
    

    @IBOutlet weak var operationButton: UIButton!
    @IBOutlet weak var GCDButton: UIButton!
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageVIew.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func choseFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
       }
    }

    func choseFromLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self;
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
    @objc func startEditing() {
        editButton.isHidden = true
        GCDButton.isHidden = false
        operationButton.isHidden = false
        descriptionTextField.isEnabled = true
    }
    
    
    
    @objc func photoButtonAction() {
        let alert = UIAlertController(title: "Set profile photo", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Choose from Library", comment: "Default action"), style: .default, handler: { _ in
            self.choseFromLibrary()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Take a photo", comment: "Default action"), style: .default, handler: { _ in
             self.choseFromCamera()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getChangedData() ->
        
    @objc func gcdSave() {
        
    }
    
    @objc func operationSave() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextField.backgroundColor = UIColor.clear
        descriptionTextField.borderStyle = .none
        
        editButton.layer.cornerRadius = 16
        editButton.layer.borderWidth = 2
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.addTarget(self, action: #selector(ProfileViewController.startEditing), for: .touchUpInside)
        
        profileImageVIew.layer.cornerRadius = 30
        profileImageVIew.layer.masksToBounds = true
        
        photoButton.layer.cornerRadius = 30
        photoButton.addTarget(self, action: #selector(ProfileViewController.photoButtonAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        GCDButton.frame.size.width = (view.frame.width - 48) / 2
        GCDButton.layer.cornerRadius = 16
        GCDButton.layer.borderWidth = 2
        GCDButton.layer.borderColor = UIColor.black.cgColor
        GCDButton.addTarget(self, action: #selector(ProfileViewController.gcdSave), for: .touchUpInside)
        
        operationButton.frame.size.width = (view.frame.width - 48) / 2
        operationButton.frame.origin.x = GCDButton.frame.maxX + 16
        operationButton.layer.cornerRadius = 16
        operationButton.layer.borderWidth = 2
        operationButton.layer.borderColor = UIColor.black.cgColor
        operationButton.addTarget(self, action: #selector(ProfileViewController.operationSave), for: .touchUpInside)
    }
    
    

}

