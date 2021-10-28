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
    let cell = CustomCell()
    let abc = ["Worth a try", "I think not", "Better to rethink", "Of course", "Worth an effort"]
    var cba = [true, true, true, true, true]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setViews()
    }
    
    private func setViews() {
        
        view.addSubview(answersTable)
        answersTable.snp.makeConstraints{ make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view.center.y)
            make.height.equalTo(view).dividedBy(2)
            make.width.equalTo(view)
        }
        answersTable.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        answersTable.dataSource = self
        answersTable.delegate = self

    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abc.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            cba[indexPath.row] = !cba[indexPath.row]
        } else {
            cell.accessoryType = .checkmark
            cba[indexPath.row] = !cba[indexPath.row]
        }
        tableView.cellForRow(at: indexPath)?.isSelected = false
        tableView.reloadData()
        print(cba)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answersTable.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.editingAccessoryType = .checkmark
        if cba[indexPath.row] { cell.accessoryType = .checkmark } else { cell.accessoryType = .none }
        cell.textLabel!.text = abc[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
}
