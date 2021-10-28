//
//  SettingsViewController.swift
//  8Ball
//
//  Created by Danylo Tymofieiev on 27.10.2021.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    private let answersTable = UITableView()
    private var searchTextField = UITextField()
    private let addTextButton = UIButton()
    let abc = ["a", "b", "c"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()

    }
    
    private func setViews() {
//        view.addSubview(answersTable)
//        answersTable.backgroundView?.backgroundColor = .yellow
//        answersTable.snp.makeConstraints{ (make) -> Void in
//            answersTable.translatesAutoresizingMaskIntoConstraints = false
//            make.bottom.equalTo(view.snp_bottomMargin)
//            make.right.equalTo(view.snp_rightMargin)
//            make.left.equalTo(view.snp_leftMargin)
//            make.top.equalTo(view.snp_centerYWithinMargins)
//            make.bottom = view.bottomAnchor
//            answersTable.leftAnchor = view.leftAnchor
//            answersTable.rightAnchor = view.rightAnchor
//            answersTable.topAnchor = view.centerYAnchor
//        }
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField = UITextField.init(frame: CGRect(x: 50, y: 70, width: 300, height: 20))
        searchTextField.placeholder = "dasdas"
        searchTextField.snp.makeConstraints{ (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(12)
        }
        print(searchTextField.frame)
//        translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(addTextButton)
//        translatesAutoresizingMaskIntoConstraints = false
    }
 
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answersTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
