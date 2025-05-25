//
//  AppCoordinator.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//
import UIKit

protocol CitySelectionCoordinator {
    func presentCitySelection(from viewController: UIViewController, citiesPageVC: CitiesPageViewController?)
    
}
class AppCoordinator: CitySelectionCoordinator {
    
    private let navigationController: UINavigationController
    private let appRouter: AppRouter
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.appRouter = AppRouter(navigationController: navigationController)
    }
    
    func start() {
        let citiesViewModel = CitiesPageViewModel()
        citiesViewModel.didTapShowOnMap = { [weak self] city in
            self?.appRouter.showMap(for: city)
        }
        citiesViewModel.coordinator = self
        appRouter.showCitiesPage(with: citiesViewModel)
    }
    
    
    func presentCitySelection(from viewController: UIViewController, citiesPageVC: CitiesPageViewController?) {
        let alert = UIAlertController(title: "Choose City", message: nil, preferredStyle: .actionSheet)
        
        let cities = ["Baku", "Ganja", "Sheki"]
        for cityName in cities {
            alert.addAction(UIAlertAction(title: cityName, style: .default, handler: { _ in
                if let pageVC = citiesPageVC,
                   let model = pageVC.viewModel.cities.first(where: { $0.name == cityName }) {
                    pageVC.goToCity(model)
                }
            }))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}

