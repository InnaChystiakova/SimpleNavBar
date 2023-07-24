//
//  ViewController.swift
//  SimpleNavBar
//
//  Created by Инна Чистякова on 23.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Constraints & properties
    
    let imageView = UIImageView(image: .init(systemName: "person.crop.circle.fill"))
    let scrollView = UIScrollView()
    let side: CGFloat = 36
    let marginRight: CGFloat = 18
    let marginBottom: CGFloat = 12

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
                
        setupScrollView()
        setupImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var largeTitleView = UIView()
        navigationController?.navigationBar.subviews.forEach({ view in
            guard view.description.contains("UINavigationBarLargeTitleView") else { return }
            largeTitleView = view
        })
        
        largeTitleView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -marginRight),
            imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -marginBottom)
        ])
    }
    
    // MARK: Setup

    func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 3)
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
    func setupImage() {
        
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .gray
        
        var largeTitleView = UIView()
            navigationController?.navigationBar.subviews.forEach({ view in
              guard view.description.contains("UINavigationBarLargeTitleView") else { return }
              largeTitleView = view
            })
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: side),
            imageView.heightAnchor.constraint(equalToConstant: side),
        ])
        largeTitleView.addSubview(imageView)
    }
}

