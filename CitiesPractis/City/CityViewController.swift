//
//  CityViewController.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit

class CityViewController: UIViewController {
    let city: CityModel
    var onShowMap: (() -> Void)?
    var coordinator: CitySelectionCoordinator?
    
    init(city: CityModel) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        let cityImageView = UIImageView()
        cityImageView.image = UIImage(named: city.cityImage.rawValue)
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.clipsToBounds = true
        
        let cityNameLabel = UILabel()
        cityNameLabel.text = city.name
        cityNameLabel.font = .boldSystemFont(ofSize: 24)
        cityNameLabel.textAlignment = .center
        
        let cityDescriptionLabel = UILabel()
        cityDescriptionLabel.text = city.description
        cityDescriptionLabel.font = .systemFont(ofSize: 16)
        cityDescriptionLabel.numberOfLines = 0
        cityDescriptionLabel.textAlignment = .center
        
        let showOnMapButton = UIButton(type: .system)
        showOnMapButton.setTitle("Show on Map", for: .normal)
        showOnMapButton.backgroundColor = UIColor(named: "map")
        showOnMapButton.tintColor = .white
        showOnMapButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        showOnMapButton.translatesAutoresizingMaskIntoConstraints = false
        showOnMapButton.layer.cornerRadius = 12
        showOnMapButton.addTarget(self, action: #selector(showOnMapTapped), for: .touchUpInside)
        
        let chooseCityButton = UIButton(type: .system)
        chooseCityButton.setTitle("Choose City", for: .normal)
        chooseCityButton.backgroundColor = UIColor(named: "city")
        chooseCityButton.tintColor = .white
        chooseCityButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        chooseCityButton.translatesAutoresizingMaskIntoConstraints = false
        chooseCityButton.layer.cornerRadius = 12
        chooseCityButton.addTarget(self, action: #selector(showCityActionSheet), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [cityImageView, cityNameLabel, cityDescriptionLabel, showOnMapButton, chooseCityButton])
        
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cityImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc
    private func showOnMapTapped() {
        onShowMap?()
    }
    
    @objc
    private func showCityActionSheet() {
        let parentPageVC = self.parent as? CitiesPageViewController
        coordinator?.presentCitySelection(from: self, citiesPageVC: parentPageVC)
    }
}
