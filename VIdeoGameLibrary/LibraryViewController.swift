//
//  LibraryViewController.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class LibraryViewController: UIViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    @IBOutlet weak var gameTableView: UITableView!
    
    //Gets library instance
    let library = Library.sharedInstance
    
    //Updates library when the view loads
    override func viewDidLoad() {
        
        //Empty data source shtuff
        gameTableView.emptyDataSetSource = self
        gameTableView.emptyDataSetDelegate = self
        
        // A little trick for removing the cell separators when empty
        gameTableView.tableFooterView = UIView()
        
        //Adds preset games into array
        super.viewDidLoad()
        PopulateGames()
    }
    
    //Updates library when view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameTableView.reloadData()
    }
    
    //Fills game array with preset games
    func PopulateGames() {
        //3 preset games
        library.games.append(Game(title: "Starlink", description: "The modern Starfox everyone wanted", genre: .action, rating: .E10, availability: .checkedIn))
        library.games.append(Game(title: "Towerfall", description: "The multiplayer indie gem", genre: .action, rating: .E, availability: .checkedIn))
        library.games.append(Game(title: "Undertale", description: "The RPG where no one has to die!", genre: .rpg, rating: .E10, availability: .checkedIn))
    }
    
    //Check in and check out functions
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.availability = .checkedOut(dueDate: dueDate)
        (gameTableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
        
    }
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.availability = .checkedIn
        (gameTableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    //Sets the title for the empty view
    func title(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "Your library is currently empty."
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0), NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    //Sets the description for the empty view
    func description(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "Try adding some games!"
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0), NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.paragraphStyle: paragraph]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    //Sets the button for the empty view
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView?, for state: UIControl.State) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0), NSAttributedString.Key.foregroundColor: UIColor(red:0.24, green:0.49, blue:0.96, alpha:1.0)]
        
        return NSAttributedString(string: "Add Game", attributes: attributes)
    }
}

//Manages the cells
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
    }
    
    //Returns if the empty data set should disply
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView?) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        
        let game = library.games[indexPath.row]
        cell.setup(game: game)
        
        return cell
    }
    
    //Checks to to if there is an edit function, this is used to add swipes
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //Reload the view
            self.gameTableView.reloadData()
        }
        
        let game = library.games[indexPath.row]
        
        // If the game is checked out, we create and return the check in action.
        // If the game is checked in, we create and return the check out action.
        
        switch game.availability {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .default, title: "Check Out") { _, indexPath in
                self.checkOut(at: indexPath)
            }
            
            return [checkOutAction, deleteAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
            }
            
            return [checkInAction, deleteAction]
            
        }
    }
    
}
