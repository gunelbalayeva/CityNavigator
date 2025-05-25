//
//  CitiesPageBuilder.swift
//  CitiesPractis
//
//  Created by User on 23.05.25.
//

import Foundation
import UIKit

class CitiesPageBuilder {
    static func build(with viewModel: CitiesPageViewModel) -> UIViewController {
        let viewController = CitiesPageViewController(viewModel: viewModel)
        return viewController
    }
}
