//
//  Extension + ChoiceVC.swift
//  WeatherApp
//
//  Created by admin on 16.05.2021.
//

import UIKit

extension ChoiceVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        let cityName = cityToPerform[row][0]
        let countryShortname = cityToPerform[row][1]
        let countryCode = cityToPerform[row][2]
        forecastData = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName),\(countryShortname),\(countryCode)&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    }
}
