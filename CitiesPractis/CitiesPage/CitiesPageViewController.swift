//
//  CitiesPageViewController.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit

class CitiesPageViewController: UIPageViewController {
    let viewModel: CitiesPageViewModel
    var pages: [CityViewController] = []
    var didSelectCityFromList: ((CityModel) -> Void)?
    
    init(viewModel: CitiesPageViewModel) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Cities"
        dataSource = self
        delegate = self
        setupPages()
    }
    
    private func setupPages() {
        pages = viewModel.cities.map { city in
            let cityVC = CityViewController(city: city)
            cityVC.onShowMap = { [weak self] in
                self?.viewModel.didTapShowOnMap?(city)
            }
            cityVC.coordinator = viewModel.coordinator
            return cityVC
        }
        
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension CitiesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! CityViewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! CityViewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}

extension CitiesPageViewController: UIPageViewControllerDelegate {}

extension CitiesPageViewController {
    func goToCity(_ city: CityModel) {
        guard let index = pages.firstIndex(where: { $0.city.name == city.name }) else { return }
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
