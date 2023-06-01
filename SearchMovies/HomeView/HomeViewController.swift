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
        guard let text = screen?.searchTextField.text, !text.isEmpty else { return }
        print(text)
        
        URLSession.shared.dataTask(with: URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=d0cbfced$s=fast%20and&type=movie")!,
                                   completionHandler: {data, response, error in
            guard let data = data, error == nil else { return }
            
            var result: MovieResult?
            do {
                result = try JSONDecoder().decode(MovieResult.self, from: data)
                
            } catch {
                print("error")
            }
            
            guard let finalResult = result else { return }
            
            print("\(finalResult.Search.first?.Title)")
            
        }).resume()
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

