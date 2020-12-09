//
//  ViewController.swift
//  foodtracker
//
//  Created by Sk. Faisal on 1/12/20.
//  Copyright © 2020 Kousher Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var inp_food_name: UITextField!
    @IBOutlet weak var lebel_food_name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        inp_food_name.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        lebel_food_name.text=textField.text
    }
   
    @IBAction func UIButton(_ sender: Any) {
        lebel_food_name.text = "Default Text"
    }
    @IBAction func photoGestureRecognizer(_ sender: UITapGestureRecognizer) {
         // Hide the keyboard.
        inp_food_name.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
         // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary

        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func imagePickerGesture(_ sender: UITapGestureRecognizer) {
        lebel_food_name.text="gester"
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
          fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
      }
        
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
    }
    
}

