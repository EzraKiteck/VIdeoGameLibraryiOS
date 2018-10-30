//
//  Game.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class Game {
    
    enum Genre {
        case action
        case adventure
        case battleRoyale
        case platformer
        case puzzle
        case racing
        case rpg
        case shooter
        case sports
        case misc
        
    }
    enum Rating {
        case E
        case E10
        case T
        case M
        case AO
    }
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
    }
    
    let title: String
    let description: String
    let genre: Genre
    let rating: Rating
    var availability: Availability
    
    init(title: String, description: String, genre: Genre, rating: Rating, availability: Availability) {
        self.title = title
        self.description = description
        self.genre = genre
        self.rating = rating
        self.availability = .checkedIn
    }

}
