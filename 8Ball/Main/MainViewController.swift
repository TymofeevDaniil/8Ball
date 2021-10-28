//
//  MainViewController.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import UIKit
import SnapKit
import Foundation
import Alamofire


class MainViewController: UIViewController {
    
    override var canBecomeFirstResponder: Bool { return true }
    private let answerLoader = AnswerLoader()
    private let answerLabel = UILabel()
    private var theText = "Shake for a wish"
    
//    var model: MainModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.becomeFirstResponder()
        view.backgroundColor = .white
        setViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        let list = SettingsViewController().cba
        print(list)
    }
    
    private func setViews() {
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = .systemFont(ofSize: 30)
        answerLabel.backgroundColor = .white
        answerLabel.text = theText
        answerLabel.snp.makeConstraints{ (make) -> Void in
            make.center.equalTo(view)
        }
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let request = AF.request("https://8ball.delegator.com/magic/JSON/8BallTask")
        request.responseJSON { data in
            guard let dataOK = data.value,
                  let newData = dataOK as? NSDictionary,
                  let magic = newData["magic"] as? NSDictionary,
                  let answer = magic["answer"] as? String
            else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.theText = answer
                self?.answerLabel.text = answer
                self?.view.layoutSubviews()
            }
        }
    }
    
}
