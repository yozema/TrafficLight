//
//  ViewController.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 30.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let lightOff = 0.3
    let lightOn = 1.0
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var lightChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.layer.cornerRadius = redLightView.layer.bounds.height / 2
        yellowLightView.layer.cornerRadius = yellowLightView.layer.bounds.height / 2
        greenLightView.layer.cornerRadius = greenLightView.layer.bounds.height / 2
        lightChangeButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
        
    }

    @IBAction func lightChangeButtonWasTapped() {
        lightChangeButton.setTitle("NEXT", for: .normal)
        
        if redLightView.alpha == yellowLightView.alpha {
            redLightView.alpha = lightOn
            greenLightView.alpha = lightOff
        } else if redLightView.alpha > lightOff && yellowLightView.alpha == greenLightView.alpha {
            yellowLightView.alpha = lightOn
            redLightView.alpha = lightOff
        } else if yellowLightView.alpha > lightOff && greenLightView.alpha == redLightView.alpha {
            greenLightView.alpha = lightOn
            yellowLightView.alpha = lightOff
        }
    }
}

