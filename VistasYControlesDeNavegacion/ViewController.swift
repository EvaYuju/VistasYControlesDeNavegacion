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
        
        // Accedemos al webView y le asignamos url
        WKWebView.load(URLRequest(url: URL(string: "https://github.com/EvaYuju")!))
        // MapView con un a URL por defecto 
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 37.407403770, longitude: -5.975600580)
    }

    @IBAction func myButton(_ sender: Any) {
        myFakeView.isHidden = true // Mejora a ocultar myView
    }
    
}

