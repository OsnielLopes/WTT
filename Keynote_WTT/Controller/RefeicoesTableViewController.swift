//
//  ReifeicoesTableViewController.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit
import CoreData

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes: [Refeicao] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.refeicoes = RefeicaoDataManager.shared.getAll()
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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
        cell.layer.cornerRadius = 2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 5
        cell.frame = UIEdgeInsetsInsetRect(cell.frame, UIEdgeInsetsMake(100, 50, 100, 50))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            let deleteAlert = UIAlertController(title: "Tem certeza que deseja excluir?", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Sim", style: .default, handler: { (result: UIAlertAction) -> Void in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                    RefeicaoDataManager.shared.deleteRecords(ip: indexPath)
                    self.tableView?.reloadData()
            })
            let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: { (result: UIAlertAction) -> Void in
            })
            deleteAlert.addAction(action)
            deleteAlert.addAction(cancel)
            self.present(deleteAlert, animated: true, completion: nil)
        }
    }
    
   
}
