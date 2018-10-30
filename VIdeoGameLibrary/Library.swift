//
//  Library.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/29/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class Library {
    //Singleton
    static let sharedInstance = Library()
    
    var games = [Game]()
}
