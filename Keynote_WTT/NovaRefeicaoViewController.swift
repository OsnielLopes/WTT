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
    let data: RefeicaoData! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func salvarRefeicao(_ sender: Any) {
        if !(textField.text?.isEmpty)! {
            let refeicao = Refeicao(id: 0, nome: textField.text, hora: Date())
            data.add(refeicao: refeicao)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
