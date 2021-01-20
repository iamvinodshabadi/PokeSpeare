//
//  ViewController.swift
//  PokeSpeare
//
//  Created by Vinod Shabadi on 16/01/21.
//  Copyright © 2021 True Layer. All rights reserved.
//

import UIKit
import PokeSpeareSDK

class ViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.returnKeyType = .default
            searchTextField.delegate = self
        }
    }
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var searchViewModel: SearchViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel = SearchViewModel(self)
        self.title = "Search"
    }

    @IBAction func searchTapped(_ sender: Any) {
        activityIndicator.startAnimating()
        searchViewModel?.searchForPokeman(searchTextField.text ?? "")
    }
}

extension ViewController: SearchViewModelDelegate {
    func pokemonFound(_ model: PokeSpeareModel?) {
        DispatchQueue.main.async {
            if model != nil {
                
            } else {
                self.showError()
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension UIViewController {
    func showError() {
        let alert = UIAlertController(title: "Sorry", message: "We could not find the pokemon you were looking for.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
}
