//
//  LibraryCell.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 11/1/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell {
    
    //Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var availabilityView: UIView!
    var game: Game = Game(title: "Game", description: "Description", genre: .action, rating: .E, availability: .checkedIn)
    
    //Used to put the details of a game onto a cell
    func setup(game: Game) {
        titleLabel.text = game.title
        genreLabel.text = game.genre.rawValue
        ratingLabel.text = game.rating.symbol
        
        switch game.availability {
        case.checkedIn:
            dueDateLabel.isHidden = true
            availabilityView.backgroundColor = .green
            
        case .checkedOut(let date):
            dueDateLabel.isHidden = false
            availabilityView.backgroundColor = .red
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyy"
            dueDateLabel.text = dateFormatter.string(from: date)
        }
    }
}
