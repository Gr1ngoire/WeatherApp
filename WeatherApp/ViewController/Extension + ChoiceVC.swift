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
        return cityToPerform.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityToPerform[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        let cityName = cityToPerform[row].name
        let countryShortname = cityToPerform[row].shortName
        let countryCode = cityToPerform[row].code
        forecastData = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName),\(countryShortname),\(countryCode)&appid=81be0b9fd939f7a141f2f5aa5ad0b4d9"
    }
}
