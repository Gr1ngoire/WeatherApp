//
//  ChoiceVC.swift
//  WeatherApp
//
//  Created by admin on 15.05.2021.
//

import UIKit

class ChoiceVC: UIViewController {
    
    
    @IBOutlet weak var mainStackView: UIPickerView!
    @IBOutlet weak var cityPicker: UIPickerView!
    
    // required: picker row index, cities for picker, json link and cities array to  generate a link
    var selectedRow = 0
    
    
    var forecastData = "http://api.openweathermap.org/data/2.5/weather?q=Kyiv,ua,380&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    
    var cityToPerform = CityIniyializer.shared.giveCities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // making gradient
        createGradient(upperColor: UIColor.purple, lowerColor: UIColor.red)
        
        //city picker setup
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // remaking gradient
        createGradient(upperColor: UIColor.purple, lowerColor: UIColor.red)
    }
    
    
    // get the forecast
    @IBAction func cityPickButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "sendingCity", sender: self)
    }
    
    // MARK: - Getting the Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "sendingCity" else { return }
        let segueVC = segue.destination as! ForecastViewController
        segueVC.forecastURL = forecastData
        segueVC.receiveForecast()
        
    }
    
}
