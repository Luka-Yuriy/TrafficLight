//
//  ViewController.swift
//  TrafficLight
//
//  Created by Yuri Luka on 27/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redSection: UIView!
    @IBOutlet var yellowSection: UIView!
    @IBOutlet var greenSection: UIView!
    
    @IBOutlet var colorChangeButton: UIButton!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    private var currentLight: CurrentLight = .red
    
    override func viewWillLayoutSubviews() {
        redSection.layer.cornerRadius = redSection.frame.width / 2
        yellowSection.layer.cornerRadius = redSection.frame.width / 2
        greenSection.layer.cornerRadius = redSection.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        colorChangeButton.layer.cornerRadius = 16
        
        redSection.alpha = lightIsOff
        yellowSection.alpha = lightIsOff
        greenSection.alpha = lightIsOff
    }

    @IBAction func colorChangeButtonDidTapped() {
        if colorChangeButton.currentTitle == "START" {
            colorChangeButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redSection.alpha = lightIsOn
            greenSection.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowSection.alpha = lightIsOn
            redSection.alpha = lightIsOff
            currentLight = .green
        case .green:
            greenSection.alpha = lightIsOn
            yellowSection.alpha = lightIsOff
            currentLight = .red
        }
    }
}

extension ViewController {
    private enum CurrentLight {
        case red
        case yellow
        case green
    }
}
