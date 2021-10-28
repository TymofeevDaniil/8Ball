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
    
    var answer: String
    
    required init?(data: NSDictionary) {
        guard let magicContainer = data["magic"] as? NSDictionary,
              let answer = magicContainer["answer"] as? String
        else {
            return nil
        }
        self.answer = answer
    }
    
//    func loadAnswer(completion: @escaping (AnswerLoader) -> Void){
//        AF.request("https://8ball.delegator.com/magic/JSON/8BallTask").responseJSON { jsonData in
//            if let data = jsonData.result,
//               let jsonDic = data as? NSDictionary{
//                guard let answer = AnswerLoader(data: jsonDic) else {
//                    print("WEATHER ERROR"); return
//                }
//                DispatchQueue.main.async { completion(answer) }
//                }
//            }
//        }
//        AF.request("https://8ball.delegator.com/magic/JSON/8BallTask").responseJSON { jsonData in
//                if let data = jsonData.result.value,
//                   let jsonDic = data as? NSDictionary{
//                    guard let weatherData = WeatherData(data: jsonDic) else {
//                        print("WEATHER ERROR"); return
//                    }
//                    DispatchQueue.main.async { completion(weatherData) }
//                    }
//                }
//        }
}
