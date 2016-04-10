//
//  PDHRegistrationController.swift
//  PDH
//
//  Created by Ellan Jesse on 11/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHRegistrationController: PDHViewController {
    
    private var registrationDataManager: PDHRegistrationDataManager!
    private var imagePicker: UIImagePickerController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.view as! PDHRegistrationView).delegate = self
    }
    
    deinit {
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Private Methods
extension PDHRegistrationController {
    private func registration(data: [String: AnyObject]) {
        PDHProgressIndicator.showLoadingIndicator(self.view)
        registrationDataManager.registerWithData(data)
    }
    
    private func initaializeDataManager() {
        registrationDataManager = PDHRegistrationDataManager()
        registrationDataManager.delegate = self
    }
    
    private func performRegistration(data: [String: AnyObject]) {
        initaializeDataManager()
        registration(data)
    }
    
    
    private func initializeImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    private func showImagePicker() {
        initializeImagePicker()
        imagePicker.allowsEditing = false
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.cameraCaptureMode = .Photo
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}

// MARK:- ViewAction Delegate
extension PDHRegistrationController: ViewActionDelegate{
    func viewDidPerformAction(action: ViewActions, data: [String: AnyObject]?) {
        switch action {
        case .Back:
            self.navigationController?.popViewControllerAnimated(true)
        case .FormFieldError:
            showFormFieldError()
        case .Register:
            performRegistration(data!)
        case .Camera:
            showImagePicker()
        default:
            fatalError("Error")
        }
    }
}

// MARK:- DataManager Protocol
extension PDHRegistrationController{
    func didReceiveDataWithSuccess(response: AnyObject) {
        PDHProgressIndicator.hideLoadingIndicator()
        if let response = response as? PDHLoginInfoDataObject {
            PDHRegistrationDataManager.saveUserData(response)
            self.performSegueWithIdentifier("menuScreen", sender: nil)
        }
    }
}

// MARK:- UIImagePicker Controller
extension PDHRegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        dismissViewControllerAnimated(true) { [unowned self]() -> Void in
            (self.view as! PDHRegistrationView).setImage(selectedImage)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}