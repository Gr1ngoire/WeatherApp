//
//  Extension + UIViewController.swift
//  WeatherApp
//
//  Created by admin on 15.05.2021.
//

import UIKit

extension UIViewController {
    func createGradient(upperColor: UIColor , lowerColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [upperColor.cgColor, lowerColor.cgColor]
        self.view.layer.insertSublayer(gradient, at:0)
    }
}
