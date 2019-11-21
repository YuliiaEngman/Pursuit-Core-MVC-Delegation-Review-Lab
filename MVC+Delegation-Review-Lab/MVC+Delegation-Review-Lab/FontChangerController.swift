//
//  FontChangerController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Yuliia Engman on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit
//
//    @IBOutlet weak var slider: UISlider!
//    @IBOutlet weak var sliderStatus: UILabel!
//and another IBAction for stepper
//
//
//1
//2
//3
//4
//@IBAction func stepperFunction(_ sender: UIStepper) {
//    slider.value = Float(sender.value)
//    sliderStatus.text = Int(sender.value).description
//}

class FontChangerController: UIViewController {
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var changeFontLabel: UILabel!
    
    
    //var movie: Movie?
    
//
//    var stepperFont: Double = 17.0
//    var sliderFont: Float = 17.0
    
    var stepperFont: Double = 17.0 {
    didSet {
    changeFontLabel.text = "Preview Font Size: \(stepperFont)"
    }
    }
    
    //    var sliderFont: Float = 17.0 {
    //        didSet {
    //            changeFontLabel.text = "Preview Font Size: \(sliderFont)"
    //        }
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepper()
        configureSlide()
        // Do any additional setup after loading the view.
    }
    
    func configureStepper() {
        stepperOutlet.minimumValue = 5.0
        stepperOutlet.maximumValue = 50.0
        stepperOutlet.stepValue = 1.0
        
        // default start value
        stepperOutlet.value = 17.0
    }
    
    func configureSlide() {
        sliderOutlet.minimumValue = 5
        sliderOutlet.maximumValue = 50
        sliderOutlet.value = 17
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        stepperOutlet.value = Double(sender.value)
        stepperFont = Double(sender.value)
        //sliderFont = sender.value
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        sliderOutlet.value = Float(sender.value)
        stepperFont = sender.value // of type Double
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
    }
    
    
}


//@IBAction func stepperFunction(_ sender: UIStepper) {
//    slider.value = Float(sender.value)
//    sliderStatus.text = Int(sender.value).description
//}


//var cohort: Double = 6.9 {
//    didSet {
//        stepperLabel.text = "Looking at \(stepperControl.value) Cohort."
//    }
//}
//
//var currentSegmentIndex: Int = 0{
//    didSet {
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
//            imageView.image = #imageLiteral(resourceName: "cat")
//        case 1:
//            imageView.image = #imageLiteral(resourceName: "dog")
//        default:
//            imageView.image = #imageLiteral(resourceName: "pitons")
//        }
//    }
//}
//
//var currentYear: Float = 2012 {
//    didSet {
//        sliderLabel.text = String(format: "%0.f", sliderControl.value)
//    }
//}
//
//// MARK: - View Controller Life Cycle methods
//override func viewDidLoad() {
//    super.viewDidLoad()
//    configureStepper()
//    configureSlide()
//
//    // Do any additional setup after loading the view.
//}
//
//func configureStepper() {
//    stepperControl.minimumValue = 1.0
//    stepperControl.maximumValue = 7.0
//    stepperControl.stepValue = 1.0
//
//    // default start value
//    stepperControl.value = 6.0
//}
//
//func configureSlide() {
//    sliderControl.minimumValue = 1978
//    sliderControl.maximumValue = 2019
//    sliderControl.value = 2012
//}
//
//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(true)
//    print("cvc - viewWillAppear")
//}
//
//// MARK: - actions and methods
//
//@IBAction func switchToggled(_ sender: UISwitch) {
//    switchValue = sender.isOn // of type Bool, true or false
//}
//
//@IBAction func stepperChanged(_ sender: UIStepper) {
//    cohort = sender.value // of type Double
//}
//
//@IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
//    currentSegmentIndex = sender.selectedSegmentIndex //0, 1
//}
//
//
//@IBAction func sliderChanged(_ sender: UISlider) {
//    currentYear = sender.value
//}
