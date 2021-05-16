//
//  Forecast.swift
//  WeatherApp
//
//  Created by admin on 15.05.2021.
//

import Foundation

struct Coord: Decodable {
    var lon: Float?
    var lat: Float?
}

struct Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Main: Decodable {
    var temp: Float?
    var feels_like: Float?
    var temp_min: Float?
    var temp_max: Float?
    var pressure: Int?
    var humidity: Int?
}

struct Wind: Decodable {
    var speed: Float?
    var deg: Int?
}

struct Clouds: Decodable {
    var all: Int
}

struct Sys: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}

struct Forecast: Decodable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
}
