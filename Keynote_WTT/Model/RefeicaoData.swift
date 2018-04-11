//
//  ModelDelegate.swift
//  Keynote_WTT
//
//  Created by Osniel Lopes Teixeira on 10/04/2018.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import Foundation

protocol RefeicaoData {
    func getAll() -> [Refeicao]
    func add(refeicao: Refeicao)
    func remove(id: Int)
}
