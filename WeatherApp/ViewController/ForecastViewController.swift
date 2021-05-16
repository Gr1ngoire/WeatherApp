//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by admin on 15.05.2021.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // required outlets
    @IBOutlet weak var dataStackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherValueLabel: UILabel!
    @IBOutlet weak var tempValueLabel: UILabel!
    
    private var foreCast: Forecast!
    var forecastURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // while getting the data
        dataStackView.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        // making the gradient
        createGradient(upperColor: UIColor.white, lowerColor: UIColor.red)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // after getting the data
        updateData(with: foreCast)
        activityIndicator.stopAnimating()
        dataStackView.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // remaking the gradient
        createGradient(upperColor: UIColor.purple, lowerColor: UIColor.red)
    }
    
    @IBAction func getBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // update weather button
    @IBAction func updateTheWeather(_ sender: Any) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        receiveForecast()
        updateData(with: foreCast)
        activityIndicator.stopAnimating()
    }
    
    
}

extension ForecastViewController {
    // receive data method
    func receiveForecast() {
        guard let url = URL(string: forecastURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let forecast = try JSONDecoder().decode(Forecast.self, from: data)
                self.foreCast = forecast
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    // update data method
    func updateData(with forecast: Forecast) {
        DispatchQueue.main.async { [self] in
            cityNameLabel.text = forecast.name ?? ""
            weatherValueLabel.text = forecast.weather?[0].description ?? ""
            tempValueLabel.text = String(Int(forecast.main?.temp ?? 0.0) - 273)
            
        }
    }
}
