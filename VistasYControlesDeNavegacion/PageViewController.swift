//
//  PageViewController.swift
//  VistasYControlesDeNavegacion
//
//  Created by Eva Lopez Marquez on 18/4/23.
//

import UIKit

class PageViewController: UIPageViewController {
    
    // vble privada de tipo array y contiene controladores, inicializada vacia
    private var myControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myYellowVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcYellow")
        let myPurpleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "vcPurple")
        
        // Para llenar el array con los controladores
        myControllers.append(myYellowVC)
        myControllers.append(myPurpleVC)
        
        // El primer controlador que queremos que se vea
        // Operacion setVCs([array del primer elemento], haciadelante, animado y tras la animacion que no haga nada
        setViewControllers([myYellowVC], direction: .forward, animated: true, completion: nil)
        //setViewControllers([myPurpleVC], direction: .forward, animated: true, completion: nil)
        
        // Porque queremos que se ejecuten las siguientes op. delegadas con el protocolo en nuestra misma clase.
        dataSource = self
    }
}


// extender de :UIPageViewControllerDataSource = Protocolo que vamos a utilizar para implementar diferentes op. asociadas al PageViewC.
extension PageViewController: UIPageViewControllerDataSource {
    // Para mostrar las páginas según en la dirección que nos desplacemos
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Primero recuperar el índice
        // Constante index para el indice donde nos encontramos
        let index = myControllers.firstIndex(of: viewController)
        // Comprobaremos si el indice = 0 pasaremos al otro y viceversa
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Igual para cada indice que tengamos
        let index = myControllers.firstIndex(of: viewController)
        if index == 0 {
            return myControllers.last
        }
        return myControllers.first
    }
    
    
}
