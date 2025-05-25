//
//  CitiesPageViewModel.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation

class CitiesPageViewModel {
    let cities: [CityModel] = [
        CityModel(name: "Baku", description: "Baku is divided into twelve administrative raions and 48 townships. Among these are the townships on the islands of the Baku Archipelago, as well as the industrial settlement of Neft Daşları built on oil rigs 60 kilometres (37 miles) away from Baku city in the Caspian Sea. The Old City, containing the Palace of the Shirvanshahs and the Maiden Tower, was designated as a UNESCO World Heritage Site in 2000.[11]", latitude: 40.4093, longitude: 49.8671, cityImage: .baku),
        
        CityModel(name: "Ganja", description: "Ganja (/ˈɡændʒə/; Azerbaijani: Gəncə [ɟænˈdʒæ] ⓘ) is Azerbaijan's third largest city, with a population of around 335,600.[2][3][4] The city has been a historic and cultural center throughout most of its existence. It was the capital of the Ganja Khanate until 1804; after Qajar Iran ceded it to the Russian Empire following the Treaty of Gulistan in 1813, it became part of the administrative divisions of the Georgia Governorate, Georgia-Imeretia Governorate, Tiflis Governorate, and Elizavetpol Governorate.[5][6][7] Following the dissolution of the Russian Empire and the Transcaucasian Democratic Federative Republic, it became a part of the Azerbaijan Democratic Republic, followed by Azerbaijan SSR, and, since 1991, the Republic of Azerbaijan.", latitude: 40.6828, longitude: 46.3606, cityImage: .ganja),
        
        CityModel(name: "Sheki", description: "Shaki (Azerbaijani: Şəki, Azerbaijani pronunciation: [ʃæ'ki]) is a city in northwestern Azerbaijan, surrounded by the district of the same name. It is located in the southern part of the Greater Caucasus mountain range, 240 km (150 mi) from Baku. As of 2020, it has a population of 68,400.[2] The center of the city and the Palace of Shaki Khans were inscribed in the UNESCO World Heritage List in 2019 because of their unique architecture and history as an important trading center along the Silk Road.[3]", latitude: 41.1919, longitude: 47.1706, cityImage: .shaki)
    ]
    
    var didTapShowOnMap: ((CityModel) -> Void)?
    var didSelectCity: (() -> Void)?
    var coordinator: CitySelectionCoordinator?
}
