//
//  ViewController.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeView?
    
    var listView: [String] = ["test 1", "test 2", "test 3", "test 4" ]
    
    override func loadView() {
        screen = HomeView()
        self.view = screen
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.screen?.configProtocolsTextField(delegate: self)
        self.screen?.configProtocolsTableView(delegate: self, dataSource: self)
    }
    
    

}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let texto: String =  self.screen?.searchTextField.text ?? ""
        print(texto)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listView[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
