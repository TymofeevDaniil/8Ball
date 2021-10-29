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
    private let settingsModel = SettingsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsModel.checkedAnswers = Persistance.shared.load()
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
        settingsModel.savedAnswers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            settingsModel.checkedAnswers[indexPath.row] = !settingsModel.checkedAnswers[indexPath.row]
        } else {
            cell.accessoryType = .checkmark
            settingsModel.checkedAnswers[indexPath.row] = !settingsModel.checkedAnswers[indexPath.row]
        }
        Persistance.shared.save(newCheckList: settingsModel.checkedAnswers)
        tableView.cellForRow(at: indexPath)?.isSelected = false
        tableView.reloadData()
        print(settingsModel.checkedAnswers)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answersTable.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.editingAccessoryType = .checkmark
        settingsModel.checkedAnswers = Persistance.shared.load()
        if settingsModel.checkedAnswers[indexPath.row] { cell.accessoryType = .checkmark } else { cell.accessoryType = .none }
        cell.textLabel!.text = settingsModel.savedAnswers[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
}
