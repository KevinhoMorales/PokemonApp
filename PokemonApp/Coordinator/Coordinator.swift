//
//  Coordinator.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func start()
}
