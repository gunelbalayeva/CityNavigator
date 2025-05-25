//
//  AppRouter.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit

class AppRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showCitiesPage(with viewModel: CitiesPageViewModel) {
        let citiesViewController = CitiesPageBuilder.build(with: viewModel)
        navigationController.setViewControllers([citiesViewController], animated: false)
    }

    func showMap(for city: CityModel) {
        let mapViewController = MapViewController(city: city)
        navigationController.pushViewController(mapViewController, animated: true)
    }
}
