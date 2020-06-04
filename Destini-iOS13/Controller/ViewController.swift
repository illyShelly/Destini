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
  
  var storyBrain = StoryBrain() // new instance of StoryBrain stored in var
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  @IBAction func choiceMade(_ sender: UIButton) {
    // which button was clicked, choice1 => tag = 1 or choice2 => 2
    let choiceMade = sender.tag
    
    storyBrain.nextStory(userChoice: choiceMade)
    updateUI()
  }
  
  func updateUI() {
    // storyBrain.stories[storyBrain.storyNumber].title
    storyLabel.text = storyBrain.getStoryTitle()
    
    choice1Button.setTitle(storyBrain.getButtonOneName(), for: .normal)
    choice2Button.setTitle(storyBrain.stories[storyBrain.storyNumber].choice2, for: .normal)
  }
  
}

