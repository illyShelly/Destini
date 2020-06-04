//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var storyLabel: UILabel!
  @IBOutlet weak var choice1Button: UIButton!
  @IBOutlet weak var choice2Button: UIButton!
  
  let stories = [
    Story(t: "You see a fork in the road.", ch1: "Take a left.", ch2: "Take a right."),
    Story(t: "You see a tiger.", ch1: "Shout for help.", ch2: "Play dead."),
    Story(t: "You find a treasure chest.", ch1: "Open it", ch2: "Check for traps."),
    Story(t: "1. choice find a treasure chest.", ch1: "Open it", ch2: "Check for traps."),
    Story(t: "2. choice You find a treasure chest.", ch1: "Open it", ch2: "Check for traps."),
    Story(t: "1.1 choice You find a treasure chest.", ch1: "Open it", ch2: "Check for traps."),
     Story(t: "2.1 choice You find a treasure chest.", ch1: "Open it", ch2: "Check for traps.")
  ]
  
  var storyNumber = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  @IBAction func choiceMade(_ sender: UIButton) {
    // which button was clicked, choice1 => tag = 1 or choice2 => 2
    let choiceMade = sender.tag
    
    //  avoid crash app -> storyNumber increase until 2 last stories
    if storyNumber < stories.count - 2 {
      
      // check if storyNumber == 0 (1. story) and clicked 1. choice (tag = 1)
      if choiceMade == 1 && storyNumber == 0 {
       storyNumber += 1 // 0, 1
      // otherwise storyNumber != 0 (1st story) OR clicked
      } else {
        storyNumber += 2 // choice1 => 1, 3, 5; choice2 => 2, 4, 6...story's index
      }
    }
    updateUI()
  }
  
  func updateUI() {
    storyLabel.text = stories[storyNumber].title
    choice1Button.setTitle(stories[storyNumber].choice1, for: .normal)
    choice2Button.setTitle(stories[storyNumber].choice2, for: .normal)
  }
  
}

