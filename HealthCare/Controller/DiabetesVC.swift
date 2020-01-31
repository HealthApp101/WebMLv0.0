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

    @IBOutlet var DiabetesTextField: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func detect(){
        
        guard let output = try? Diabetes.model.prediction(Pregnancies: Diabetes.Variables[0], Glucose: Diabetes.Variables[1], BloodPressure: Diabetes.Variables[2], SkinThickness: Diabetes.Variables[3], Insulin: Diabetes.Variables[4], BMI: Diabetes.Variables[5], DiabetesPedigreeFunction: Diabetes.Variables[6], Age: Diabetes.Variables[7])
            else{
                fatalError("Input")
        }
        let result = output.Outcome
        self.navigationItem.title = "\(result)"
        print(output)
        print(result)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        var count = 0
           for textfields in DiabetesTextField{
               Diabetes.Variables.append(Double(textfields.text!) ?? Diabetes.mean[count])
               
               count = count+1
           }
           detect()
           for textfields in DiabetesTextField {
               textfields.text = " "
           }

    }
    
}
