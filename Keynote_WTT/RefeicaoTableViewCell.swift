//
//  RefeicaoTableViewCell.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 11/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class RefeicaoTableViewCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var refeicaoImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var horaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

