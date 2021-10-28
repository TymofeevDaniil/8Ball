//
//  MainViewController.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import UIKit
import SnapKit
//import Foundation

class MainViewController: UIViewController {
    
    var setButton = UIButton()
    var answerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        createUI()

    }
    
    func createUI() {
        view.addSubview(answerLabel)
        answerLabel.font = .systemFont(ofSize: 30)
        answerLabel.backgroundColor = .white
        answerLabel.text = "Sample Text"
        answerLabel.snp.makeConstraints{ (make) -> Void in
            make.center.equalTo(view)
        }

        view.addSubview(setButton)
        setButton.isUserInteractionEnabled = true
        setButton.backgroundColor = .white
        setButton.setImage(UIImage(systemName: "gear"), for: .normal)
        setButton.setTitleColor(.black, for: .normal)
        setButton.accessibilityActivationPoint = setButton.center
        setButton.snp.makeConstraints{ (make) -> Void in
//            make.centerY.equalTo(view.frame.minY + 70)
//            make.centerX.equalTo(view.frame.maxX - 50)
            make.width.equalTo(100)
            make.height.equalTo(100)
            
        }
        setButton.addTarget(self, action: #selector(goToSettings(sender:)), for: .touchUpInside)
    }
    
    @objc func goToSettings(sender: UIButton!) {
        show(SettingsViewController(), sender: self)
    }

}
