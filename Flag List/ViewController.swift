//
//  ViewController.swift
//  Flag List
//
//  Created by Matheus Franceschini on 23/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let flags: [String] = [
        "argentina",
        "australia",
        "brazil",
        "canada",
        "chile",
        "china",
        "egypt",
        "finland",
        "france",
        "germany",
        "greece",
        "india",
        "ireland",
        "italy",
        "jamaica",
        "japan",
        "mexico",
        "netherlands",
        "philippines",
        "portugal",
        "russia",
        "south-africa",
        "south-korea",
        "sweden",
        "switzerland",
        "turkey",
        "usa"
    ]
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ViewController")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewController", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row].uppercased()
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.flagName = flags[indexPath.row].uppercased()
        vc.selectedImage = flags[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

#Preview {
    ViewController()
}
