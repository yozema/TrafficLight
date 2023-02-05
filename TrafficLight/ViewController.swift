//
//  ViewController.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 30.01.2023.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

final class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
   
    @IBOutlet var lightChangeButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightOff = 0.3
    private let lightOn = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightChangeButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
        
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.height / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.height / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.height / 2
    }

    @IBAction func lightChangeButtonWasTapped() {
        if lightChangeButton.currentTitle == "START" {
            lightChangeButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lightOff
            redLightView.alpha = lightOn
            currentLight = CurrentLight.yellow
        case .yellow:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            currentLight = CurrentLight.green
        case .green:
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOn
            currentLight = CurrentLight.red
        }
    }
}

