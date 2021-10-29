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
    private let answerLabel = UILabel()
    private let settingsViewModel = SettingsViewModel()
    private let mainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsViewModel.model.checkedAnswers = Persistance.shared.load()
        self.becomeFirstResponder()
        view.backgroundColor = .white
        setViews()
    }
    
    private func setViews() {
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = .systemFont(ofSize: 30)
        answerLabel.backgroundColor = .white
        answerLabel.text = "Shake for a wish"
        answerLabel.snp.makeConstraints{ (make) -> Void in
            make.center.equalTo(view)
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.text = "Thinking..."
        view.layoutSubviews()
        mainViewModel.manageAnswer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [unowned self] in
            answerLabel.text = mainViewModel.answer
            view.layoutSubviews()
        }
    }
    
}
