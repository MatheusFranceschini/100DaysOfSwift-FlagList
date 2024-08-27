//
//  DetailViewController.swift
//  Flag List
//
//  Created by Matheus Franceschini on 26/08/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImage: String?
    var flagName: String!
    
    private lazy var flagImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: selectedImage ?? ""))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var flagNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .black
        label.text = flagName ?? ""
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        setupNavigationBar()
    }
    
    private func addSubviews() {
        view.addSubview(flagImageView)
        view.addSubview(flagNameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 360),
            flagImageView.heightAnchor.constraint(equalToConstant: 200),
            
            flagNameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 24),
            flagNameLabel.centerXAnchor.constraint(equalTo: flagImageView.centerXAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc func shareButtonTapped() {
        guard let image = flagImageView.image?.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        guard let text = flagNameLabel.text else {
            return
        }
        
        let viewController = UIActivityViewController(activityItems: [image, text.uppercased()], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
