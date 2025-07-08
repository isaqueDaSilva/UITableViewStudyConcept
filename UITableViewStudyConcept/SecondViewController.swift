//
//  SecondViewController.swift
//  UITableViewStudyConcept
//
//  Created by Isaque da Silva on 7/8/25.
//

import UIKit

final class SecondViewController: UIViewController {
    private let label = UILabel()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        
        self.setupView()
    }
}

extension SecondViewController {
    func setLabel(with name: String) {
        self.label.text = name
        self.label.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    private func setupView() {
        self.view.addSubview(label)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

#Preview {
    let vc = SecondViewController()
    vc.setLabel(with: "Apple")
    
    return vc
}
