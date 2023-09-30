//
//  ViewController.swift
//  homework3
//
//  Created by Глеб Клыга on 29.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UILabels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    // MARK: - UISliders
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - UIView
    
    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupLabels()
        // Do any additional setup after loading the view.
    }
    // MARK: - Private functions
    
    private func setupSliders() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setupLabels() {
        redLabel.text = "Red"
        redLabel.font = UIFont.systemFont(ofSize: 18)
        redLabel.textColor = .black
        greenLabel.text = "Green"
        greenLabel.font = UIFont.systemFont(ofSize: 18)
        greenLabel.textColor = .black
        blueLabel.text = "Blue"
        blueLabel.font = UIFont.systemFont(ofSize: 18)
        blueLabel.textColor = .black
    }
    
    private func updateBackgroundColor() {
        if let red = redSlider?.value,
           let green = greenSlider?.value,
           let blue = blueSlider?.value {
            let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
            colorView?.backgroundColor = color
        }
    }
    
    // MARK: - @IBAction functions
    
    @IBAction func redChangerSlider(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        redValueLabel.text = value
        updateBackgroundColor()
    }
    
    @IBAction func greenChangerSlider(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        greenValueLabel.text = value
        updateBackgroundColor()
        
    }
    
    @IBAction func blueChangerSlider(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        blueValueLabel.text = value
        updateBackgroundColor()
    }
}

