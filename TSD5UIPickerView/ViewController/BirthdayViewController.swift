//
//  PersonsBirthdayViewController.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 19.01.2022.
//

import UIKit

final class BirthdayViewController: UIViewController {
    
    private let tableView = UITableView()
    private var persons = [Person(name: "Dmitry", birthdayDate: "\(Date())", age: 29, gender: "Male", insta: "@kurli")]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateTableViewData(with person: Person) {
        self.persons.append(person)
        tableView.performBatchUpdates({ tableView.insertRows(at: [IndexPath(row: self.persons.count - 1, section: 0)], with: .automatic)
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Persons"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    @objc private func addButtonTapped() {
        let newPersonViewController = NewPersonViewController { [weak self] (person) in
            self?.updateTableViewData(with: person)
        }
        navigationController?.present(newPersonViewController, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK:- UITableViewDataSource

extension BirthdayViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.reuseId, for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.accessoryType = .detailButton
        cell.configureCell(name: persons[indexPath.row].name, date: persons[indexPath.row].birthdayDate)
        
        return cell
    }
}

