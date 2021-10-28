//
//  AnswerLoader.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 28.10.2021.
//

import Foundation
import Alamofire
import Foundation

class AnswerLoader {
    
    private var answer: String?
    
    func loadAnswer() -> String? {
        let request = AF.request("https://8ball.delegator.com/magic/JSON/8BallTask")
        request.responseJSON { data in
            
            guard let dataOK = data.value,
                  let newData = dataOK as? NSDictionary,
                  let magic = newData["magic"] as? NSDictionary,
                  let answer = magic["answer"] as? String
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.answer = answer
            }
            print("==loader this== \(answer)")
        }
        return (answer != nil) ? answer : nil
    }
    
}
