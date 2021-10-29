//
//  MainViewModel.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import Foundation
import Alamofire

class MainViewModel {
    
    var answer = String()
    let mainModel = MainModel()
    let settingsModel = SettingsModel()
    
//MARK: - here you can change url to check failed request
    func manageAnswer() {
        settingsModel.checkedAnswers = Persistance.shared.load()
        let url: MainModel.URLType = .correct // (.correct) or (.wrong)
        let request = AF.request(url.rawValue)
        request.responseJSON { [unowned self] data in
            guard let dataOK = data.value,
                  let newData = dataOK as? NSDictionary,
                  let magic = newData["magic"] as? NSDictionary,
                  let answer = magic["answer"] as? String
            else {
                if !settingsModel.checkedAnswers.contains(true) { answer = "ERROR"; return }
                var hcAnswers: [String] = []
                for i in 0..<self.settingsModel.savedAnswers.count {
                    if self.settingsModel.checkedAnswers[i] {
                        hcAnswers.append(settingsModel.savedAnswers[i])
                    }
                }
                print("possible HC answers are: \(hcAnswers)")
                answer = hcAnswers.randomElement()!
                DispatchQueue.main.async { [unowned self] in
                    answer = hcAnswers.randomElement()!
                }
                return
            }
            DispatchQueue.main.async { [unowned self] in
                self.answer = answer
            }
        }
    }
 
}
