//
//  MainViewController.swift
//  Keynote_WTT
//
//  Created by Ane Gomes on 13/04/18.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        b1.layer.cornerRadius = 3
        b2.layer.cornerRadius = 3
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
