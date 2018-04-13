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

class RefeicaoDataManager {
    
    static public var shared = RefeicaoDataManager()
    
    private init() { }
    
    func getAll() -> [Refeicao] {
        do {
            let entities = try DatabaseController.persistentContainer.viewContext.fetch(NSRefeicao.fetchRequest())
            if let refeicoes = entities as? [NSRefeicao] {
                var rs: [Refeicao] = []
                for r in refeicoes {
                    rs.append(Refeicao(nome: r.name, hora: r.date! as Date, image: r.getPicture()))
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
    
    
    func deleteRecords(ip: IndexPath) -> Void {
        
        let managedContext = DatabaseController.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NSRefeicao")
        
        let result = try? managedContext.fetch(fetchRequest)
        
        var resultData = result as! [NSRefeicao]
        let removedCell = resultData[ip.row]
        managedContext.delete(removedCell)
        
        do{
            try managedContext.save()
        } catch {
            print("Failed to remove meal")
    }
}
//    func removeRecord(id: NSManagedObjectID) {
//        do {
//            let obj = try DatabaseController.persistentContainer.viewContext.existingObject(with: id)
//            DatabaseController.persistentContainer.viewContext.delete(obj)
//        } catch {
//            print("Failed to remove refeicao with id \(id)")
//        }
//    }
    
}
