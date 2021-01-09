//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkManagerDataResource {
    func getDataFromServer(data: [Skills])
}

class NetworkManager {
    
    var arrayUsers = [Skills]()
    var users: Skills?
    // PROPIEDAD DEL PROTOCOLO
    let delegate: NetworkManagerDataResource
    
    init(delegate: NetworkManagerDataResource) {
        self.delegate = delegate
    }
    
    func getPokemonSkillsData(pokemonID: String) {
        AF.request(Constants.EndPoints.pokemonSkills + pokemonID).responseJSON { [self] response in
            switch response.result {
            case .success:
                let myResult = try? JSON(data: response.data!)
                let abilities = myResult!["abilities"]
                for i in abilities.arrayValue {
                    let ability = i["ability"].dictionaryValue
                    let name = ability["name"]!.stringValue
                    let user = Skills(abilities: [Abilities(ability: Ability(name: name))])
                    arrayUsers.append(user)
                    delegate.getDataFromServer(data: arrayUsers)
                }
            case .failure(let error):
                print("El nuevo error -> \(error.localizedDescription)")
            }
        }
    }
    
}
