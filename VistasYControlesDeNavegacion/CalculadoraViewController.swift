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
    
    // MARK: - Variables
    
    private var total: Double = 0                   // Total
    private var temp: Double = 0                    // Valor por pantalla
    private var operating = false                   // Indicar si se ha seleccionado un operador
    private var decimal = false                     // Indicar si el valor es decimal
    private var operation: OperationType = .none    // Operación actual
    
    // MARK: - Constantes
    
    // *! "k"+NombreConstante
    private let kDecimalSeparator = Locale.current.decimalSeparator! // Uso coma/punto según uso local
    private let kMaxLength = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.000000001
    //private let kTotal = "total"
    
    // enum asociado a var operation para el tipo de operación
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
    }
    
    // Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo de valores por pantalla en formato científico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
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
        
        coma.setTitle(kDecimalSeparator, for: .normal)
    }
    
    // MARK: - Button Actions
    
    // Operaciones
    @IBAction func clearAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    @IBAction func signoBtnAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func porcentajeBtnAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    @IBAction func dividirAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division
        sender.shine()
    }
    @IBAction func multiplicAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplication
        
        sender.shine()
    }
    @IBAction func restaAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .substraction
        sender.shine()
    }
    @IBAction func sumarAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .addiction
        //sender.selectOperation(true)
        
        sender.shine()
        
    }
    @IBAction func igualAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    @IBAction func comaAction(_ sender: UIButton) {
        // Valor formateado de nuestro nº temporal
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        // Comprobar sí no estamos operando y la longitud correcta
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator // concatenar a una cadena con el decimal
        decimal = true
        sender.shine()
    }
    
    // Números
    @IBAction func numAction(_ sender: UIButton) {
        clearBtn.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }

        //currentTemp = auxFormatter.string(from: NSNumber(value: temp))!

        // Hemos seleccionado una operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Hemos seleccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)" // concatenar a una cadena con el decimal
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))! // * no hay riesgo de que sea nulo
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        //selectVisualOperation()
        
        sender.shine()
        print(sender.tag)
    }
    
    // MARK: - Funciones
    
    // Limpia/resetea los valores
    private func clear() {
        operation = .none
        clearBtn.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    // Obtiene el resultado final
    private func result() {
        
        switch operation {
            
        case .none:
            // No hacemos nada
            break
        case .addiction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        // Formateo en pantalla
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("TOTAL: \(total)")
        
    }
    
    
}
