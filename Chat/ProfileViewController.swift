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
    @IBOutlet weak var descriptionLabel: UILabel!

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.layer.cornerRadius = 15
        editButton.layer.borderWidth = 2
        editButton.layer.borderColor = UIColor.black.cgColor
        
        profileImageVIew.layer.cornerRadius = 30
        profileImageVIew.layer.masksToBounds = true
        
        photoButton.layer.cornerRadius = 30
        photoButton.addTarget(self, action: #selector(ProfileViewController.photoButtonAction), for: .touchUpInside)
        
        print(editButton.frame) // SE and X have differnet screen sizes, so it's not yet recalculated here
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        descriptionLabel.sizeToFit()
        print(editButton.frame)
    }
    

}

