//
//  ViewController.swift
//  homework3
//
//  Created by Глеб Клыга on 29.09.23.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    func updateViewColor(with color: UIColor )
}


class SettingsViewController: UIViewController{
    
    @IBOutlet weak var paintedView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    @IBOutlet weak var redComponentLabel: UILabel!
    @IBOutlet weak var greenComponentLabel: UILabel!
    @IBOutlet weak var blueComponentLabel: UILabel!
    
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var color: UIColor!
    weak var delegate: ColorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupTextFields()
        updateViews(withColor: color)
        
    }
    
    override func viewDidLayoutSubviews() {
        paintedView.layer.cornerRadius = 15
        paintedView.layer.borderWidth = 1
        paintedView.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
    @IBAction func changeColorSlider(_ sender: UISlider) {
        var red, green, blue: CGFloat
        switch sender.tag {
        case 0:
            red = CGFloat(sender.value)
            green = CGFloat(greenSlider.value)
            blue = CGFloat(blueSlider.value)
        case 1:
            red = CGFloat(redSlider.value)
            green = CGFloat(sender.value)
            blue = CGFloat(blueSlider.value)
        default:
            red = CGFloat(redSlider.value)
            green = CGFloat(greenSlider.value)
            blue = CGFloat(sender.value)
        }
        updateViews(withColor: UIColor(red: red, green: green, blue: blue, alpha: 1))
    }
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.updateViewColor(with: paintedView.backgroundColor!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        guard let red = Float(redTextField.text!.isEmpty ? "0" : redTextField.text!), red <= 1.0 else {
            showAlert("Red component should be from 0.0 to 1.0")
            return
        }
        guard let green = Float(greenTextField.text!.isEmpty ? "0" : greenTextField.text!), green <= 1.0 else {
            showAlert("Green component should be from 0.0 to 1.0")
            return
        }
        guard let blue = Float(blueTextField.text!.isEmpty ? "0" : blueTextField.text!), blue <= 1.0 else {
            showAlert("Blue component should be from 0.0 to 1.0")
            return
        }
        updateViews(withColor: UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1))
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let windowScene = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .first as? UIWindowScene
        {
            if let topWindow = windowScene.windows.last {
                topWindow.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

extension SettingsViewController {
    private func setupTextFields() {
        redTextField.addKeyboardToolbarButton(
            UIBarButtonItem(title: "Apply", style: .done, target: nil, action: #selector(dismissKeyboard)),
            position: .right)
        greenTextField.addKeyboardToolbarButton(
            UIBarButtonItem(title: "Apply", style: .done, target: nil, action: #selector(dismissKeyboard)),
            position: .right)
        blueTextField.addKeyboardToolbarButton(
            UIBarButtonItem(title: "Apply", style: .done, target: nil, action: #selector(dismissKeyboard)),
            position: .right)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func updateViews(withColor color: UIColor) {
        paintedView.backgroundColor = color
        
        redComponentLabel.text = String(format:"%.2f", color.rgba.red)
        greenComponentLabel.text = String(format:"%.2f", color.rgba.green)
        blueComponentLabel.text = String(format:"%.2f", color.rgba.blue)
        
        redSlider.value = Float(color.rgba.red)
        greenSlider.value = Float(color.rgba.green)
        blueSlider.value = Float(color.rgba.blue)
        
        if !redTextField.isFirstResponder {
            redTextField.text = String(format:"%.2f", color.rgba.red)
        }
        if !greenTextField.isFirstResponder {
            greenTextField.text = String(format:"%.2f", color.rgba.green)
        }
        if !blueTextField.isFirstResponder {
            blueTextField.text = String(format:"%.2f", color.rgba.blue)
        }
    }
    
}

