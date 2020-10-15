//
//  UploadImage.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class UploadImage: UIViewController {

    lazy var uploadImage : UIButton = {
       let ui = UIButton()
        ui.addTarget(self, action: #selector(handlePicker), for: .touchUpInside)
        ui.setImage(UIImage.init(named:"right"), for: .normal)
       return ui
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uploadImage)
        uploadImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 30, height: 30)
        
    }
    @objc func handlePicker(){
        print("Handle Picker")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    @objc func  backDismis(){
        _ = navigationController?.popViewController(animated: true)
    }
}
extension UploadImage: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // selected image
        guard let profileImage = info[.editedImage] as? UIImage else {
            
            return
        }
        // configure plusPhotoBtn with selected image
        self.dismiss(animated: true, completion: nil)
    }
}
