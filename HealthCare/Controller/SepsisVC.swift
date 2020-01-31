//
//  SepsisVC.swift
//  HealthCare
//
//  Created by Pushpinder Pal Singh on 27/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class SepsisVC : UIViewController,UINavigationControllerDelegate{
    @IBOutlet weak var HRT: UITextField!
    @IBOutlet weak var O2SatT: UITextField!
    @IBOutlet weak var SBPT: UITextField!
    @IBOutlet weak var MAPT: UITextField!
    @IBOutlet weak var RespT: UITextField!
    @IBOutlet weak var AgeT: UITextField!
    @IBOutlet weak var GenderT: UITextField!
    @IBOutlet weak var Unit1T: UITextField!
    @IBOutlet weak var Unit2: UITextField!
    @IBOutlet weak var HospAdmTimeT: UITextField!
    @IBOutlet weak var DBPT: UITextField!
    @IBOutlet weak var ICULOST: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func detect(){
        let model = sepsis()
        let HR = Double(HRT.text!) ?? 8.4
        let O2Sat = Double(O2SatT.text!) ?? 9.71
        let SBP = Double(SBPT.text!) ?? 1.23
        let MAP = Double(MAPT.text!) ?? 8.24
        let DBP = Double(DBPT.text!) ?? 6.38
        let Resp = Double(RespT.text!) ?? 1.87
        let Age = Double(AgeT.text!) ?? 6.201
        let Gender = Double(GenderT.text!) ?? 5.59
        let Unit1 = Double(Unit1T.text!) ?? 4.96
        let U2 = Double(Unit2.text!) ?? 5.03
        let HAT = Double(HospAdmTimeT.text!) ?? -5.612
        let ICU = Double(ICULOST.text!) ?? 2.69
        
        guard let output = try? model.prediction(HR: HR, O2Sat: O2Sat, SBP: SBP, MAP: MAP, DBP: DBP, Resp: Resp, Age: Age, Gender: Gender, Unit1: Unit1, Unit2: U2, HospAdmTime: HAT, ICULOS: ICU) else{
            fatalError("Input")
        }
        let result = output.SepsisLabel
        self.navigationItem.title = "\(result)"
        print(result)
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        detect()
    }
}
