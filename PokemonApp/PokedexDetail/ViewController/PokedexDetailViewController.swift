//
//  PokedexDetailViewController.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

class PokedexDetailViewController: UIViewController {

    @IBOutlet weak var skillsTableView: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    public var coordinator: MainCoordinator?
    
    private var pokemonsSkillsData = [Skills]()
    private var pokemonsSkillsDescription = [Description]()
    public var pokemon = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = pokemon
        setUpCell()
        setUpPokemonData()
        LoadingIndicatorView.show()
        // Do any additional setup after loading the view.
    }
    
    private func setUpCell() {
        let cell = UINib(nibName: "PokemonSkillsTableViewCell", bundle: nil)
        self.skillsTableView.register(cell, forCellReuseIdentifier: "skillsCell")
        skillsTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let networkManagerDescription = NetworkManagerDescription(delegate: self)
        networkManagerDescription.getPokemonSkillsData(pokemonID: "123")
    }

    private func setUpPokemonData() {
        let networkManager = NetworkManager(delegate: self)
        networkManager.getPokemonSkillsData(pokemonID: "123")
        
        
    }
    
}

extension PokedexDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsSkillsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillsCell", for: indexPath) as? PokemonSkillsTableViewCell
        let pokemon = pokemonsSkillsData[indexPath.row]
        cell?.setUpCell(poken: pokemon)
        return cell!
    }
}

extension PokedexDetailViewController: NetworkManagerDataResource {
    func getDataFromServer(data: [Skills]) {
        self.pokemonsSkillsData = data
        DispatchQueue.main.async { [self] in
            skillsTableView.reloadData()
            LoadingIndicatorView.hide()
        }
    }
}

extension PokedexDetailViewController: NetworkManagerDataResourceDescription {
    func getDataFromServerDescription(data: [Description]) {
        self.descriptionTextView.text = data[0].flavor_text_entries[59].flavor_text
        DispatchQueue.main.async { [self] in
            skillsTableView.reloadData()
            LoadingIndicatorView.hide()
        }
    }
}
