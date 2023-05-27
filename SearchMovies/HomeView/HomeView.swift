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
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var listTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.backgroundColor = .white
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchTextField)
        addSubview(listTableView)
        configSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsTextField(delegate: UITextFieldDelegate) {
        self.searchTextField.delegate = delegate
    }
    
    public func configProtocolsTableView(delegate:UITableViewDelegate, dataSource: UITableViewDataSource) {
        listTableView.delegate = delegate
        listTableView.dataSource = dataSource
    }
        
    private func configSetupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchTextField.heightAnchor.constraint(equalToConstant: 45),
            
            listTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            listTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
