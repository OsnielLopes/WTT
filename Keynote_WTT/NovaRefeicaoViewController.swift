//
//  NovaRefeicaoViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class NovaRefeicaoViewController: UIViewController {

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
    
    @IBAction func salvarRefeicao(_ sender: Any) {
        if let name = self.textField.text, let image = self.refeicaoImage {
            let refeicao = Refeicao.init(id: nil, nome: name, hora: Date(), image: image)
            RefeicaoDataManager.shared.add(refeicao: refeicao)
        }
    }

    @IBAction func scanFoodButtonPressed(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.firstTime = false
    }
}

extension NovaRefeicaoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let imgPicked = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        self.refeicaoImage = imgPicked
        self.textField.text = FoodRecognizerManager.shared.recognizeImage(imgPicked)
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
