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
import UIKit


extension NSRefeicao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSRefeicao> {
        return NSFetchRequest<NSRefeicao>(entityName: "NSRefeicao")
    }
    
    @nonobjc public class func fetchRequest(with objectID: NSManagedObjectID) -> NSFetchRequest<NSRefeicao> {
        return NSFetchRequest<NSRefeicao>(entityName: "NSRefeicao")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var name: String?

    public func setPicture(pic: UIImage) {
        self.image = NSData(data: UIImageJPEGRepresentation(pic, 0.9)!)
    }
    
    public func getPicture() -> UIImage {
        return UIImage(data: self.image! as Data)!
    }
}
