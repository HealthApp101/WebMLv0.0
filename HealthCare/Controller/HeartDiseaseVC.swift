//
//  HeartDisease.swift
//  HealthCare
//
//  Created by Pushpinder Pal Singh on 26/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class HeartDiseaseVC : UIViewController {
   
    @IBOutlet weak var ageEntered: UITextField!
    @IBOutlet weak var SexEntered: UITextField!
    @IBOutlet weak var cpEntered: UITextField!
    @IBOutlet weak var trestbpsEntered: UITextField!
    @IBOutlet weak var oldpeakEntered: UITextField!
    @IBOutlet weak var cholEntered: UITextField!
    @IBOutlet weak var slopesEntered: UITextField!
    @IBOutlet weak var restecgEntred: UITextField!
    @IBOutlet weak var thalachEntered: UITextField!
    @IBOutlet weak var caEntered: UITextField!
    @IBOutlet weak var fbsEntered: UITextField!
    @IBOutlet weak var thalEntered: UITextField!
    @IBOutlet weak var exandEntered: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func detect(){
        let model = heartdisease()
        let age = Double(ageEntered.text!) ?? 54.43
        let sex = Double(SexEntered.text!) ?? 0.69
        let cp = Double(cpEntered.text!) ?? 0.9
        let trestbps = Double(trestbpsEntered.text!) ?? 131.611
        let oldpeak = Double(oldpeakEntered.text!) ?? 1.07
        let chol = Double(cholEntered.text!) ?? 246.00
        let slopes = Double(slopesEntered.text!) ?? 1.38
        let restecg = Double(restecgEntred.text!) ?? 0.5
        let thalach = Double(thalachEntered.text!) ?? 149.11
        let ca = Double(caEntered.text!) ?? 0.75
        let fbs = Double(fbsEntered.text!) ?? 0.149
        let thal = Double(thalachEntered.text!) ?? 2.32
        let exand = Double(exandEntered.text!) ?? 0.33
        
        guard let output = try? model.prediction(age: age, sex: sex, cp: cp, trestbps: trestbps, chol: chol, fbs: fbs, restecg: restecg, thalach: thalach, exang: exand, oldpeak: oldpeak, slopes: slopes, ca: ca, thal: thal) else {
            fatalError("Input Failed")
        }
        
        let price = output.target
        self.navigationItem.title = "\(price)"
        print(price)
    }
    
    @IBAction func SubmitPressed(_ sender: UIButton) {
        detect()
    }
}
