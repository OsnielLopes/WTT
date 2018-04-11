//
//  NovaRefeicaoViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class NovaRefeicaoViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = .camera
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textField.isEnabled = false
    }
    
    @IBAction func salvarRefeicao(_ sender: Any) {
        if let name = self.textField.text {
            let refeicao = Refeicao.init(id: nil, nome: name, hora: Date(), image: UIImage())
            RefeicaoDataManager.shared.add(refeicao: refeicao)
        }
    }

    @IBAction func scanFoodButtonPressed(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
}

extension NovaRefeicaoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
    }
    
}
