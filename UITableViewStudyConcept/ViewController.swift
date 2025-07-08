//
//  ViewController.swift
//  UITableViewStudyConcept
//
//  Created by Isaque da Silva on 7/8/25.
//

import UIKit

class ViewController: UIViewController {
    private let cellID = "cell"
    private let tableView = UITableView()
    private let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Simple List"
        self.view.backgroundColor = .systemBackground
        self.setupTableView()
    }
}

// MARK: - TableView view setup -
extension ViewController {
    private func setupTableView() {
        self.view.addSubview(tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: self.cellID
        )
        
        self.setupTableViewConstrains()
    }
    
    private func setupTableViewConstrains() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor
            ),
            self.tableView.leftAnchor.constraint(
                equalTo: self.view.leftAnchor
            ),
            self.tableView.rightAnchor.constraint(
                equalTo: view.rightAnchor
            ),
            self.tableView.bottomAnchor.constraint(
                equalTo: self.view.bottomAnchor
            )
        ])
    }
}

// MARK: - Table View Configuration -
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: self.cellID,
            for: indexPath
        )
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = SecondViewController()
        let item = self.items[indexPath.row]
        secondViewController.setLabel(with: item)
        
        self.navigationController?.pushViewController(
            secondViewController,
            animated: true
        )
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    UINavigationController(
        rootViewController: ViewController()
    )
    
}
