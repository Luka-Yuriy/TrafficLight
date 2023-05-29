//
//  ViewController.swift
//  TrafficLight
//
//  Created by Yuri Luka on 27/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var colorChangeButton: UIButton!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    private var currentLight: CurrentLight = .red
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = redView.frame.width / 2
        greenView.layer.cornerRadius = redView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        colorChangeButton.layer.cornerRadius = 16
        
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }

    @IBAction func colorChangeButtonDidTapped() {
        if colorChangeButton.currentTitle == "START" {
            colorChangeButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redView.alpha = lightIsOn
            greenView.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowView.alpha = lightIsOn
            redView.alpha = lightIsOff
            currentLight = .green
        case .green:
            greenView.alpha = lightIsOn
            yellowView.alpha = lightIsOff
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
