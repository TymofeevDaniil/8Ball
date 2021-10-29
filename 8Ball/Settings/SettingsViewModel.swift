//
//  SettingsViewModel.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import Foundation
import RealmSwift

class SettingsViewModel {
    
    var managedAnswers = [String]()
    var managedCheckedAnsers = [Bool]()
    let model =  SettingsModel()
    private let persistence = Persistance()
    
    func loadCheckedAnswers() -> [String] {
        
        return [""]
    }
    
    func saveCheckedAnswers(checked: [String]) {
        
    }
    
}
