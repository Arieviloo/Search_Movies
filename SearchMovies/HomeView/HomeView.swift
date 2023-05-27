//
//  HomeView.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Os Vingadores..."
        tf.textColor = .gray
        return tf
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchTextField)
        configSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configDelegateTextField(delegate: UITextFieldDelegate) {
        self.searchTextField.delegate = delegate
    }
    
    private func configSetupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
}
