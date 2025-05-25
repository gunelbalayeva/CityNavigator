//
//  CityModel.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit

struct CityModel {
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let cityImage: CitiesImageName
    
    enum CitiesImageName:String{
        case baku
        case ganja
        case shaki
    }
}
