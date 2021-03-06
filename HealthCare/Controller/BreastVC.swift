//
//  breastVC.swift
//  HealthCare
//
//  Created by Pushpinder Pal Singh on 26/01/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class BreastVC: UIViewController{
    
    @IBOutlet var BreastTextField: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func detect(){
        guard let output = try? BreastCancer.model.prediction(radius_mean: BreastCancer.Variables[0], texture_mean: BreastCancer.Variables[1], perimeter_mean: BreastCancer.Variables[2], area_mean: BreastCancer.Variables[3], smoothness_mean: BreastCancer.Variables[4], compactness_mean: BreastCancer.Variables[5], concavity_mean: BreastCancer.Variables[6], concave_points_mean: BreastCancer.Variables[7], symmetry_mean: BreastCancer.Variables[8], fractal_dimension_mean: BreastCancer.Variables[9], radius_se: BreastCancer.Variables[10], texture_se: BreastCancer.Variables[11], perimeter_se: BreastCancer.Variables[12], area_se: BreastCancer.Variables[13], smoothness_se: BreastCancer.Variables[14], compactness_se: BreastCancer.Variables[15], concavity_se: BreastCancer.Variables[16], concave_points_se: BreastCancer.Variables[17], symmetry_se: BreastCancer.Variables[18], fractal_dimension_se: BreastCancer.Variables[19], radius_worst: BreastCancer.Variables[20], texture_worst: BreastCancer.Variables[21], perimeter_worst: BreastCancer.Variables[22], area_worst: BreastCancer.Variables[23], smoothness_worst: BreastCancer.Variables[24], compactness_worst: BreastCancer.Variables[25], concavity_worst: BreastCancer.Variables[26], concave_points_worst: BreastCancer.Variables[27], symmetry_worst: BreastCancer.Variables[28], fractal_dimension_worst: BreastCancer.Variables[29]) else{
            fatalError("Input Failed")
        }
        let result = output.target
        self.navigationItem.title = "\(result)"
        print(result)
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        var count = 0
        for textfields in BreastTextField{
            BreastCancer.Variables.append(Double(textfields.text!) ?? BreastCancer.mean[count])
            
            count = count+1
        }

       detect()
        for textfields in BreastTextField {
            textfields.text = " "
        }
    }
}
