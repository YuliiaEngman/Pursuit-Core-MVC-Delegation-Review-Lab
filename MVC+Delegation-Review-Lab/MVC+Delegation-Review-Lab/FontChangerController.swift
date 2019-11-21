//
//  FontChangerController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Yuliia Engman on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontChangerController: UIViewController {
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var changeFontLabel: UILabel!
    
        var sliderFont: Float = 17.0 {
            didSet {
                changeFontLabel.text = "Preview Font Size: \(Int(sliderFont))"
            }
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepper()
        configureSlide()
    }
    
    func configureStepper() {
        stepperOutlet.minimumValue = 5.0
        stepperOutlet.maximumValue = 50.0
        stepperOutlet.stepValue = 1.0
        
        stepperOutlet.value = 17.0
    }
    
    func configureSlide() {
        sliderOutlet.minimumValue = 5
        sliderOutlet.maximumValue = 50
        sliderOutlet.value = 17
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        stepperOutlet.value = Double(sender.value)
        sliderFont = sender.value
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        sliderOutlet.value = Float(sender.value)
        sliderFont = Float(sender.value) // of type Float
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
    }
    
    
}

