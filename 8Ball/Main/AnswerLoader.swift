//
//  AnswerLoader.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 28.10.2021.
//

//import Foundation
//import Alamofire
//import Foundation
//
//class AnswerLoader {
//    
//    var answer = String()
//    var result = false
//    
//    func loadAnswer(url: String) {
//        
//        let request = AF.request(url)
//        request.responseJSON { [weak self] data in
//            guard let dataOK = data.value,
//                  let newData = dataOK as? NSDictionary,
//                  let magic = newData["magic"] as? NSDictionary,
//                  let answer = magic["answer"] as? String
//            else { return }
//            DispatchQueue.main.async { [weak self] in
//                self?.answer = answer
//                self?.result = true
//                print("Answer loaded")
//            }
//        }
//    }
//    
//}
