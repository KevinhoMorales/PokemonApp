//
//  NetworkMangerDescription.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkManagerDataResourceDescription {
    func getDataFromServerDescription(data: [Description])
}

class NetworkManagerDescription {
    
    var arrayUsers = [Description]()
    var users: Description?
    // PROPIEDAD DEL PROTOCOLO
    let delegate: NetworkManagerDataResourceDescription
    
    init(delegate: NetworkManagerDataResourceDescription) {
        self.delegate = delegate
    }
    
    func getPokemonSkillsData(pokemonID: String) {
        AF.request(Constants.EndPoints.pokemonSkills + pokemonID).responseJSON { [self] response in
            switch response.result {
            case .success:
                let myResult = try? JSON(data: response.data!)
                let flavor_text_entries = myResult!["flavor_text_entries"]
                for i in flavor_text_entries.arrayValue {
                    let flavor_text = i["flavor_text"].stringValue
                    let user = Description(flavor_text_entries: [FlavorTextEntries(flavor_text: flavor_text)])
                    arrayUsers.append(user)
                    delegate.getDataFromServerDescription(data: arrayUsers)
                }
            case .failure(let error):
                print("El nuevo error -> \(error.localizedDescription)")
            }
        }
    }
    
}
