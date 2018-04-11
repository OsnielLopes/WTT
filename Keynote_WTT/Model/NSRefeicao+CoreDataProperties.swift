//
//  NSRefeicao+CoreDataProperties.swift
//  Keynote_WTT
//
//  Created by Guilherme Paciulli on 11/04/18.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//
//

import Foundation
import CoreData


extension NSRefeicao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSRefeicao> {
        return NSFetchRequest<NSRefeicao>(entityName: "NSRefeicao")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var name: String?

}
