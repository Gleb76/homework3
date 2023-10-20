//
//  ColorViewController.swift
//  homework3
//
//  Created by Глеб Клыга on 20.10.23.
//

import UIKit

class ColorViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//            
//    @IBAction func settingsButtonPressed(_ sender: Any) {
//        performSegue(withIdentifier: "showVC", sender: nil)
//    }
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorizeViewController = segue.destination as? SettingsViewController
        colorizeViewController?.delegate = self
        colorizeViewController?.color = view.backgroundColor
    }
    
}
extension ColorViewController: ColorViewControllerDelegate {
    func updateViewColor(with color: UIColor) {
        view.backgroundColor = color
    }
}


