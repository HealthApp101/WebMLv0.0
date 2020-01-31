//
//  LiverVC.swift
//  HealthCare
//
//  Created by Pushpinder Pal Singh on 26/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class LiverVC : UIViewController, UINavigationControllerDelegate{

    @IBOutlet var LiverTextField: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func detect(){
        
        guard let output = try? Liver.model.prediction(Age: Liver.Variables[0], Gender: Liver.Variables[1], Total_Bilirubin: Liver.Variables[2], Direct_Bilirubin: Liver.Variables[3], Alkaline_Phosphotase: Liver.Variables[4], Alamine_Aminotransferase: Liver.Variables[4], Aspartate_Aminotransferase: Liver.Variables[5], Total_Protiens: Liver.Variables[6], Albumin: Liver.Variables[7], Albumin_and_Globulin_Ratio: Liver.Variables[8]) else{
            fatalError()
        }
       
        let result = output.Dataset
        print(result)
        self.navigationItem.title = "\(result)"
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        var count = 0
        for textfields in LiverTextField{
            Liver.Variables.append(Double(textfields.text!) ?? Liver.mean[count])
            
            count = count+1
        }
        detect()
        for textfields in LiverTextField {
            textfields.text = " "
        }
    }
}
