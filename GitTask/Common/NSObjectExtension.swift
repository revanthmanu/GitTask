//
//  NSObjectExtension.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}


protocol CreateFromArray {
    
    init?(json: JsonDictionay )
}

extension CreateFromArray {
    
    ///Create array of items from json
    static func createRequiredInstances(from json: JsonDictionay , key:String) -> [Self]? {
        guard let jsonDictionaries = json[key] as? [[String: Any]] else { return nil }
        var array = [Self]()
        for jsonDictionary in jsonDictionaries {
            guard let instance = Self.init(json: jsonDictionary) else { return nil }
            array.append(instance)
        }
        return array
    }
}
