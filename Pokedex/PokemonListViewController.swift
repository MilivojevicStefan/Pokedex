//
//  ViewController.swift
//  Pokedex
//
//  Created by Стефан  Миливоевич on 5.10.22..
//
import UIKit

class PokemonListViewController: UIViewController {

    
    private var data = [String()]
    private let titleText = UILabel()
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        addElementsToView()
        addCards()
        
    }
    
    private func addElementsToView() {
        view.addSubview(titleText)
        titleText.text = "PokeDex"
        titleText.font = UIFont.boldSystemFont(ofSize: 48)
        titleText.textColor = .black
        titleText.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        
        
        
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleText.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
           
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    private func addCards() {
        for x in 1...100 {
            data.append("Number \(x)")
        }
    }

}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
}
