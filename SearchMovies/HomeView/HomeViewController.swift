//
//  ViewController.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        self.view = screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.screen?.configDelegateTextField(delegate: self)
    }

}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

