//
//  ReifeicoesTableViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes: [Refeicao] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refeicoes = RefeicaoDataManager.shared.getAll()
        self.tableView.reloadData()
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RefeicaoTableViewCell", for: indexPath) as? RefeicaoTableViewCell else {
            fatalError("The dequeued cell is not an instance of RefeicaoTableViewCell.")
        }
        
        let refeicao = refeicoes[indexPath.row]
        
        cell.nomeLabel.text = refeicao.nome
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        cell.horaLabel.text = dateFormatter.string(from: refeicao.hora)
        cell.refeicaoImage.image = refeicao.image
        
        return cell
    }
    
    
}
