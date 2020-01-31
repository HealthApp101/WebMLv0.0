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
    @IBOutlet weak var ageT: UITextField!
    @IBOutlet weak var totalBillT: UITextField!
    @IBOutlet weak var directBillT: UITextField!
    @IBOutlet weak var alkalinePhosT: UITextField!
    @IBOutlet weak var alamineAdminT: UITextField!
    @IBOutlet weak var asparateAminoT: UITextField!
    @IBOutlet weak var protienT: UITextField!
    @IBOutlet weak var alnuminT: UITextField!
    @IBOutlet weak var albuminGloT: UITextField!
    @IBOutlet weak var genderT: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func detect(){
        let model = liver()
        let age = Double(ageT.text!) ?? 44.74
        let totalBill = Double(totalBillT.text!) ?? 3.298
        let directBill = Double(directBillT.text!) ?? 1.486
        let alkalinePhos = Double(alkalinePhosT.text!) ?? 290.576
        let alamine = Double(alamineAdminT.text!) ?? 80.71
        let asparate = Double(asparateAminoT.text!) ?? 109.91
        let protien = Double(protienT.text!) ?? 6.483
        let alnumin = Double(alnuminT.text!) ?? 3.14
        let albumin = Double(albuminGloT.text!) ?? 0.947
        let gender = Double(genderT.text!) ?? 0.3
        guard let output = try? model.prediction(Age: age, Gender: gender, Total_Bilirubin: totalBill, Direct_Bilirubin: directBill, Alkaline_Phosphotase: alkalinePhos, Alamine_Aminotransferase: alamine, Aspartate_Aminotransferase: asparate, Total_Protiens: protien, Albumin: albumin, Albumin_and_Globulin_Ratio: albumin) else{
            fatalError()
        }
        let result = output.Dataset
        print(result)
        self.navigationItem.title = "\(result)"
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        detect()
    }
}
