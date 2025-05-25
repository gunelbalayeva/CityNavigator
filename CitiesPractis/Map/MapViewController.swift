//
//  MapViewController.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    private let city: CityModel

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
        setupMap()
    }

    private func setupMap() {
        let mapView = MKMapView()
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        let annotation = MKPointAnnotation()
        annotation.title = city.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude)
        mapView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
}
