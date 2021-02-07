//
//  ViewController.swift
//  MVVM_StudyProject_1
//
//  Created by Андрей Шевчук on 07.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifire)
        return table
    }()
    
    private var persons: [Person] = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configModels()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configModels() {
        let names = ["Andrew", "Olga", "Oleg", "Anatoliy", "Vanya"]
        for name in names {
            persons.append(Person(name: name, gender: .male))
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PersonTableViewCell.identifire,
                for: indexPath) as? PersonTableViewCell else { return UITableViewCell()}
        let viewModel = PersonViewModel(with: person)
        cell.configurateModel(with: viewModel)
        cell.delegate = self
        return cell
    }
}

extension ViewController: PersonTableViewCellDelegate {
    func personFollowingTableViewCell(_ cell: PersonTableViewCell, didTappedWith viewModel: PersonViewModel) {
        if viewModel.currentlyFollowing {
            
        }
    }
}
