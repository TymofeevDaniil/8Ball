//
//  HCAnswerModel.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 29.10.2021.
//

import Foundation
import RealmSwift

class Persistance{
    
    static let shared = Persistance()
    private let realm = try! Realm()
    
    func load() -> ([Bool]){
        var checkedList = [Bool]()
        let savedList = realm.objects(CheckedAnswers.self)
        guard let _ = savedList.first else {
            return [true, true, true, true, true] }
        for index in 0..<savedList.count{
            checkedList.append(savedList[index].checked)
        }
        return (checkedList)
    }

    func save(newCheckList: [Bool]) {
        let objects = realm.objects(CheckedAnswers.self)
        try! realm.write{
            realm.delete(objects)
        }
        for i in 0..<newCheckList.count{
            let savedAnswers = CheckedAnswers()
            try! realm.write{
                savedAnswers.checked = newCheckList[i]
                realm.add(savedAnswers)
            }
        }
    }
    
}
