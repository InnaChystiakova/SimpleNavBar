//
//  ViewController.swift
//  SimpleNavBar
//
//  Created by Инна Чистякова on 23.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: Constraints & properties
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let side: CGFloat = 36
    let margin: CGFloat = 18
    let fontSize: CGFloat = 40

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar"
                
        setupScrollView()
        setupStackView()
        setupAvatar()
        setupImage()
    }
    
    // MARK: Setup

    func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 3)
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
    func setupStackView() {
        stackView.frame = CGRect(x: scrollView.frame.origin.x, y: scrollView.frame.origin.y, width: scrollView.frame.size.width, height: 50)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        stackView.isLayoutMarginsRelativeArrangement = true
        scrollView.addSubview(stackView)
    }
    
    func setupAvatar() {
        let label = UILabel()
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Avatar"
        stackView.addArrangedSubview(label)
    }
    
    func setupImage() {
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: side),
            imageView.heightAnchor.constraint(equalToConstant: side)
        ])
        stackView.addArrangedSubview(imageView)
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let dimension = max(stackView.frame.size.height, -offsetY)
        let delta = dimension + offsetY
        navigationController?.navigationItem.titleView?.isHidden = (delta == 0) ? true : false
    }
}

