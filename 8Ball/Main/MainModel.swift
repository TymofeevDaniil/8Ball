//
//  MainModel.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import Foundation
import SwiftUI

class MainModel {
    
    var url = URLType.correct
    
    enum URLType: String {
        case correct = "https://8ball.delegator.com/magic/JSON/8BallTask"
        case wrong = "https://8ball.delegator.com/magic/JSON8BallTask/"
    }
    
}
