//
//  YellowViewController.swift
//  VistasYControlesDeNavegacion
//
//  Created by Eva Lopez Marquez on 18/4/23.
//

import UIKit

class YellowViewController: UIViewController {
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Primero ocultamos la label
        myLabel.isHidden = true
        
        // Llamamos a su delegado
        mySearchBar.delegate = self
    }
    
}

extension YellowViewController: UISearchBarDelegate {
    // Cuando hacemos clic en el botón buscar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Ocultaremos el teclado
        mySearchBar.resignFirstResponder()
        // Para que el label mustre el texto de la barra de busqueda
        myLabel.text = mySearchBar.text
        // Para mostrar la label que estaba oculta
        myLabel.isHidden = false
        
    }
    
    
}
