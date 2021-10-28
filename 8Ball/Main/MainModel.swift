//
//  MainModel.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import Foundation

class MainModel {
    
    var answer: String
    
    required init?(data: NSDictionary) {
        guard let magicContainer = data["magic"] as? NSDictionary,
              let name = magicContainer["answer"] as? String
        else {
            return nil
        }
        answer = name
    }
    
}
