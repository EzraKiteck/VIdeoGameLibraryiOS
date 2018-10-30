//
//  AddGameViewController.swift
//  VIdeoGameLibrary
//
//  Created by Ezra Kiteck on 10/30/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Variables
    var newGame: Game?
    var chosenRating: Game.Rating?
    var chosenGenre: Game.Genre?
    
    let genres = ["Action", "Adventure", "Battle Royale", "Platformer", "Puzzle", "Racing", "RPG", "Shooter", "Sports", "Misc."]
    
    //Input Fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Insert code here for when a row is selected
    }
    
    @IBAction func addGameButtonPressed(_ sender: Any) {
        //Sets genre equal to the selected row
        switch genrePickerView.selectedRow(inComponent: 0) {
        case 0:
            chosenGenre = Game.Genre.action
        case 1:
            chosenGenre = Game.Genre.adventure
        case 2:
            chosenGenre = Game.Genre.battleRoyale
        case 3:
            chosenGenre = Game.Genre.platformer
        case 4:
            chosenGenre = Game.Genre.puzzle
        case 5:
            chosenGenre = Game.Genre.racing
        case 6:
            chosenGenre = Game.Genre.rpg
        case 7:
            chosenGenre = Game.Genre.shooter
        case 8:
            chosenGenre = Game.Genre.sports
        case 9:
            chosenGenre = Game.Genre.misc
        default:
            chosenGenre = Game.Genre.misc
        }
        //Set rating equal to the selected segment
        switch ratingSegment.selectedSegmentIndex {
        case 0:
            chosenRating = Game.Rating.E
        case 1:
            chosenRating = Game.Rating.E10
        case 2:
            chosenRating = Game.Rating.T
        case 3:
            chosenRating = Game.Rating.M
        case 4:
            chosenRating = Game.Rating.AO
        default:
            print("This message should not appear")
        }
        //If any text fields are empty...
        guard
            let titleText = titleTextField.text, !titleText.isEmpty,
            let descriptionText = descriptionTextField.text, !descriptionText.isEmpty,
            let rating = chosenRating,
            let genre = chosenGenre
            else {
                //...send an alert to the user.
                let errorAlert = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: UIAlertController.Style.alert)
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {UIAlertAction in}
                errorAlert.addAction(dismissAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        //Else, add a game
        newGame = Game(title: titleText, description: descriptionText, genre: genre, rating: rating, availability: .checkedIn)
        print(newGame?.title as Any)
        print(newGame?.description as Any)
        print(newGame?.genre as Any)
        print(newGame?.rating as Any)
    }
}
