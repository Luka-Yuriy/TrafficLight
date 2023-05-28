//
//  ViewController.swift
//  TrafficLight
//
//  Created by Yuri Luka on 27/05/2023.
//

import UIKit

enum CurrentColor {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {
    @IBOutlet var redSection: UIView!
    @IBOutlet var yellowSection: UIView!
    @IBOutlet var greenSection: UIView!
    
    @IBOutlet var colorChangeButton: UIButton!
    
    private var currentColor = CurrentColor.red
    private let lightIsON: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorChangeButton.layer.cornerRadius = 12
        
        redSection.layer.cornerRadius = 60
        yellowSection.layer.cornerRadius = 60
        greenSection.layer.cornerRadius = 60
        
        redSection.alpha = lightIsOff
        yellowSection.alpha = lightIsOff
        greenSection.alpha = lightIsOff
    
    }

    @IBAction func colorChangeButtonDidTapped() {
        colorChangeButton.setTitle("NEXT", for: .normal)
        
        switch currentColor {
        case .red:
            redSection.alpha = lightIsON
            yellowSection.alpha = lightIsOff
            greenSection.alpha = lightIsOff
        case .yellow:
            redSection.alpha = lightIsOff
            yellowSection.alpha = lightIsON
            greenSection.alpha = lightIsOff
        case .green:
            redSection.alpha = lightIsOff
            yellowSection.alpha = lightIsOff
            greenSection.alpha = lightIsON
        }
        
    }
    
}

