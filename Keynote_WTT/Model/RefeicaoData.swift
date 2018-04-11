//
//  ModelDelegate.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol RefeicaoData {
    func getAll() -> [Refeicao]
    func add(refeicao: Refeicao)
    func remove(id: NSManagedObjectID)
}

class DatabaseManager: RefeicaoData {
    
    var shared: DatabaseManager = DatabaseManager()
    
    private init() { }
    
    func getAll() -> [Refeicao] {
        do {
            let entities = try DatabaseController.persistentContainer.viewContext.fetch(NSRefeicao.fetchRequest())
            if let refeicoes = entities as? [NSRefeicao] {
                var rs: [Refeicao] = []
                for r in refeicoes {
                    rs.append(Refeicao(id: r.objectID, nome: r.name, hora: r.date! as Date, image: r.getPicture()))
                }
                return rs
            }
        } catch {
            fatalError("Failed to fetch refeicoes: \(error)")
        }
        return []
    }
    
    func add(refeicao: Refeicao) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "NSRefeicao", into: DatabaseController.persistentContainer.viewContext)
        if let nsRefeicao = entity as? NSRefeicao {
            nsRefeicao.name = refeicao.nome
            nsRefeicao.date = refeicao.hora! as NSDate
            nsRefeicao.setPicture(pic: refeicao.image)
        }
        DatabaseController.saveContext()
    }
    
    func remove(id: NSManagedObjectID) {
        do {
            let obj = try DatabaseController.persistentContainer.viewContext.existingObject(with: id)
            DatabaseController.persistentContainer.viewContext.delete(obj)
        } catch {
            print("Failed to remove refeicao with id \(id)")
        }
    }
    
}
