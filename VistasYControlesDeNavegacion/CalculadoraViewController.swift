//
//  CalculadoraViewController.swift
//  VistasYControlesDeNavegacion
//
//  Created by Eva Lopez Marquez on 3/5/23.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var num0: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    @IBOutlet weak var coma: UIButton!
    @IBOutlet weak var igual: UIButton!
    @IBOutlet weak var sumaBtn: UIButton!
    @IBOutlet weak var restaBtn: UIButton!
    @IBOutlet weak var multiplicBtn: UIButton!
    @IBOutlet weak var dividirBtn: UIButton!
    @IBOutlet weak var porcentajeBtn: UIButton!
    @IBOutlet weak var signoBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        num0.round()
        num1.round()
        num2.round()
        num3.round()
        num4.round()
        num5.round()
        num6.round()
        num7.round()
        num8.round()
        num9.round()
        coma.round()
        igual.round()
        sumaBtn.round()
        restaBtn.round()
        multiplicBtn.round()
        dividirBtn.round()
        porcentajeBtn.round()
        signoBtn.round()
        clearBtn.round()
    }
    
    // MARK: - Button Actions
    
    // Operaciones
    @IBAction func clearAction(_ sender: UIButton) {
    }
    @IBAction func signoBtnAction(_ sender: UIButton) {
    }
    @IBAction func porcentajeBtnAction(_ sender: UIButton) {
    }
    @IBAction func dividirAction(_ sender: UIButton) {
    }
    @IBAction func multiplicAction(_ sender: UIButton) {
    }
    @IBAction func restaAction(_ sender: UIButton) {
    }
    @IBAction func sumarAction(_ sender: UIButton) {
    }
    @IBAction func igualAction(_ sender: UIButton) {
    }
    @IBAction func comaAction(_ sender: UIButton) {
    }
    
    // Números
    @IBAction func numAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
    
    
    
    
    
}
