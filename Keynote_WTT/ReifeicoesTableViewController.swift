//
//  ReifeicoesTableViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class ReifeicoesTableViewController: UITableViewController {
    
    let refeicoes: [Refeicao] = RefeicaoDataManager.shared.getAll()
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RefeicaoTableViewCell", for: indexPath) as? RefeicaoTableViewCell else {
            fatalError("The dequeued cell is not an instance of RefeicaoTableViewCell.")
        }
        
        let refeicao = refeicoes[indexPath.row]
        
        cell.nomeLabel.text = refeicao.nome
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        cell.horaLabel.text = dateFormatter.string(from: refeicao.hora)
        cell.refeicaoImage = UIImageView(image: refeicao.image)
        
        return cell
    }
    
    
}
