//
//  ViewController.swift
//  VistasYControlesDeNavegacion
//
//  Created by Eva Lopez Marquez on 17/4/23.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var WKWebView: WKWebView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Titular pantalla navigation
        title = "My View controller"
        
        // Desempaquetar
        if let url = URL(string: "https://google.com") {
            WKWebView.load(URLRequest(url: url))
        }
        
        // Accedemos al webView y le asignamos url
        //WKWebView.load(URLRequest(url: url))
        // MapView con un a URL por defecto 
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 37.407403770, longitude: -5.975600580)
    }
    
    @IBAction func myButton(_ sender: Any) {
        myFakeView.isHidden = true // Mejora a ocultar myView
    }
    
}

