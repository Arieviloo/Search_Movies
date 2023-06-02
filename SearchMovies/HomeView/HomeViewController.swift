//
//  ViewController.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    init()  {
        self.pages = [MoviesPage]()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var screen: HomeView?
    
    
    var listView: [String] = ["test 1", "test 2", "test 3", "test 4" ]
    private var pages: [MoviesPage] {
        didSet {
            self.screen?.listTableView.reloadData()
        }
    }
    
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
        
        
        let services = HomeService()
        services.runApi { result in
            switch result {
            case .success(let page):
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    self.pages.append(page)
                    //                    self.screen?.listTableView.reloadData()
                }
                //                print(self.pages.count)
                
                
                
            case .failure(let erro):
                print(erro)
                
            }
            
        }
        
        
    }
    
    
    
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = screen?.searchTextField.text, !text.isEmpty else { return }
        print(text)
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.flatMap({$0.movies}).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pages.flatMap({$0.movies})[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

