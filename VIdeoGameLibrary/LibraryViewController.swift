//
//  LibraryViewController.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var gameTableView: UITableView!
    
    let library = Library.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library.games.append(Game(title: "Starlink", description: "The modern Starfox everyone wanted", genre: .action, rating: .E10, availability: .checkedIn))
        
        library.games.append(Game(title: "Towerfall", description: "The multiplayer indie gem", genre: .action, rating: .E, availability: .checkedIn))
        
        library.games.append(Game(title: "Undertale", description: "The RPG where no one has to die!", genre: .rpg, rating: .E10, availability: .checkedIn))
        
        gameTableView.reloadData()
    }
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = library.games[indexPath.row].title
        
        return cell
    }
}
