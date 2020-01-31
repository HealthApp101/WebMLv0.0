//
//  DiabetesVC.swift
//  HealthCare
//
//  Created by Pushpinder Pal Singh on 26/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class DiabetesVC : UIViewController, UINavigationControllerDelegate{
    @IBOutlet weak var Agetext: UITextField!
    @IBOutlet weak var pregnancies: UITextField!
    @IBOutlet weak var Glucosetext: UITextField!
    @IBOutlet weak var bpText: UITextField!
    @IBOutlet weak var skinThickText: UITextField!
    @IBOutlet weak var InsulinText: UITextField!
    @IBOutlet weak var BMItext: UITextField!
    @IBOutlet weak var DPFtext: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func detect(){
        let model = diabetesmlmodel()
        let age = Double(Agetext.text!) ?? 33
        let preg = Double(pregnancies.text!) ?? 4
        let glucose = Double(Glucosetext.text!) ?? 120
        let bp = Double(bpText.text!) ?? 69
        let skin = Double(skinThickText.text!) ?? 20
        let insulin = Double(InsulinText.text!) ?? 80
        let bmi = Double(BMItext.text!) ?? 31.992
        let dpf = Double(DPFtext.text!) ?? 0.4718
        guard let output = try? model.prediction(Pregnancies: preg, Glucose: glucose, BloodPressure: bp, SkinThickness: skin, Insulin: insulin, BMI: bmi, DiabetesPedigreeFunction: dpf, Age: age)
            else{
                fatalError("Input")
        }
        let result = output.Outcome
        self.navigationItem.title = "\(result)"
        print(output)
        print(result)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
         detect()
    }
    
}
