//
//  Game.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class Game {
    
    enum Genre: String {
        case action = "Action"
        case adventure = "Adventure"
        case battleRoyale = "Battle Royale"
        case platformer = "Platformer"
        case puzzle = "Puzzle"
        case racing = "Racing"
        case rpg = "RPG"
        case shooter = "Shooter"
        case sports = "Sports"
        case misc = "Misc."
        
    }
    enum Rating: String{
        case E = "Everyone"
        case E10 = "Ten Plus"
        case T = "Teen"
        case M = "Mature"
        case AO = "Adults Only"
        
        var symbol: String {
            switch self {
            case .E: return "E"
            case .E10: return "E10"
            case .T: return "T"
            case .M: return "M"
            case .AO: return "AO"
            }
        }
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
