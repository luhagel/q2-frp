
//
//  ViewController.swift
//  DataBindings-demo
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
  @IBOutlet weak var greetingsLabel: UILabel!
  @IBOutlet weak var greetingsTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet var greetingButtons: [UIButton]!
  
  var buttonGreeting = "Hello"
  var fieldGreeting = ""
  
  var greetingsString: String = "Hello" {
    didSet {
      greetingsLabel.text = greetingsString + " " + nameString
    }
  }
  
  var nameString: String = "John" {
    didSet {
      greetingsLabel.text = greetingsString + " " + nameString
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    greetingsLabel.text = "Hello John"
  }
  
  @IBAction func stateChanged(_ sender: UISegmentedControl) {
    print("state changed -> \(sender.selectedSegmentIndex)")
    switch sender.selectedSegmentIndex {
    case 0:
      fieldGreeting = greetingsString
      greetingsTextField.isUserInteractionEnabled = false
      for button in greetingButtons {
        button.isUserInteractionEnabled = true
        button.tintColor = UIColor.blue
      }
      greetingsString = buttonGreeting
    case 1:
      buttonGreeting = greetingsString
      greetingsTextField.isUserInteractionEnabled = true
      for button in greetingButtons {
        button.isUserInteractionEnabled = false
        button.tintColor = .gray
      }
      greetingsString = fieldGreeting
    default:
      print("Invalid Segmented Control State!")
    }
  }
  
  @IBAction func greetingsButtonPressed(_ sender: UIButton) {
    greetingsString = (sender.titleLabel?.text)!
  }
  
  @IBAction func nameTextChanged(_ sender: UITextField) {
    nameString = sender.text ?? ""
  }

  @IBAction func greetingsTextChaged(_ sender: UITextField) {
    greetingsString = sender.text ?? ""
  }
  
}

