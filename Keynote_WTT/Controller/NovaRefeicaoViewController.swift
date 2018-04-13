//
//  NovaRefeicaoViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class NovaRefeicaoViewController: UIViewController, UITextFieldDelegate {

    //IBOutlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    //Instance Variables
    var imagePicker: UIImagePickerController!
    
    //New refeicao properties
    var refeicaoImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .camera
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    var firstTime = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if firstTime { self.present(self.imagePicker, animated: true, completion: nil) }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.firstTime = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func salvarRefeicao(_ sender: Any) {
        if let name = self.textField.text, let image = self.refeicaoImage {
            let refeicao = Refeicao.init(nome: name, hora: Date(), image: image)
            RefeicaoDataManager.shared.add(refeicao: refeicao)
            
            //let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let viewController = storyboard.instantiateViewController(withIdentifier: "refeições")
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func scanFoodButtonPressed(_ sender: Any) {
        
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.firstTime = false
    }
    
    // MARK: - Keyboard Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: false)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
   
}

extension NovaRefeicaoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "main")
        picker.pushViewController(viewController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imagePicker.dismiss(animated: true, completion: nil)
        guard let imgPicked = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        self.refeicaoImage = imgPicked
        self.textField.text = FoodRecognizerManager.shared.recognizeImage(imgPicked)
        self.imageView.image = imgPicked
        self.imageView.layer.cornerRadius = 5
    }
    
    
}
