//
//  ViewController.swift
//  Pokedex
//
//  Created by Стефан  Миливоевич on 5.10.22..
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    
    
    var data = [String()]
    let titleText = UILabel()
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 1...100 {
            data.append("Number \(x)")
        }
        view.backgroundColor = .white
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        addElements()
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//
//    }
    
    func addElements() {
        view.addSubview(titleText)
        titleText.text = "PokeDex"
        titleText.font = UIFont.boldSystemFont(ofSize: 48)
        titleText.textColor = .black
        titleText.translatesAutoresizingMaskIntoConstraints = false
        table.frame = view.bounds
        view.addSubview(table)
        
        
        
        
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

}

