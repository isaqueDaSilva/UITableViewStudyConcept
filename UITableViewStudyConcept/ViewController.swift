//
//  ViewController.swift
//  UITableViewStudyConcept
//
//  Created by Isaque da Silva on 7/8/25.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Simple List"
        self.view.backgroundColor = .systemBackground
        self.setupTableView()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        
        // Configurar delegate e datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Registrar uma célula padrão
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Ativar Auto Layout manualmente (view code)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

#Preview {
    UINavigationController(
        rootViewController: ViewController()
    )
    
}
