//
//  FoodRecognizerManager.swift
//  Keynote_WTT
//
//  Created by Guilherme Paciulli on 11/04/18.
//  Copyright © 2018 Osniel Lopes Teixeira. All rights reserved.
//

import Foundation
import UIKit
import CoreML

class FoodRecognizerManager {
    
    static public let shared = FoodRecognizerManager()
    
    private let model = Food101()
    
    private let size = CGSize(width: 299, height: 299)
    
    private init() { }
    
    func recognizeImage(_ image: UIImage) -> String {
        
        guard let buffer = image.resize(to: self.size)?.pixelBuffer() else {
            fatalError("Scaling or converting to pixel buffer failed!")
        }
        
        guard let result = try? model.prediction(image: buffer) else {
            fatalError("Prediction failed!")
        }
        
        return result.classLabel
    }
    
    
}
