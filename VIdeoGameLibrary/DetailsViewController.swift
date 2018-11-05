//
//  DetailsViewController.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 11/5/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //Variables
    var game = Game(title: "This is Game", description: "This is description", genre: .action, rating: .E, availability: .checkedIn)
    
    //UI Properties
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var genreText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Display title, description, rating, and genre
        titleText.text = game.title
        descriptionTextView.text = game.description
        descriptionTextView.isEditable = false
        ratingText.text = "Rating:  \(game.rating.rawValue)"
        genreText.text = "Genre:  \(game.genre.rawValue)"
    }
    

}
