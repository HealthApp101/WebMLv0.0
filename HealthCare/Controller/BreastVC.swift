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
    @IBOutlet weak var radiusMean: UITextField!
    @IBOutlet weak var textureMean: UITextField!
    @IBOutlet weak var perimeterMean: UITextField!
    @IBOutlet weak var areaMean: UITextField!
    @IBOutlet weak var smoothnessMean: UITextField!
    @IBOutlet weak var compactnessMean: UITextField!
    @IBOutlet weak var concavityMean: UITextField!
    @IBOutlet weak var concavePointsMean: UITextField!
    @IBOutlet weak var symmetryMean: UITextField!
    @IBOutlet weak var fractulDimensionMean: UITextField!
    @IBOutlet weak var radiusSe: UITextField!
    @IBOutlet weak var textureSe: UITextField!
    @IBOutlet weak var perimeterSe: UITextField!
    @IBOutlet weak var areaSe: UITextField!
    @IBOutlet weak var smoothnessSe: UITextField!
    @IBOutlet weak var compactnessSe: UITextField!
    @IBOutlet weak var concavitySe: UITextField!
    @IBOutlet weak var concavePointsSe: UITextField!
    @IBOutlet weak var symmetrySe: UITextField!
    @IBOutlet weak var fractulDimensionSe: UITextField!
    @IBOutlet weak var radiusWorst: UITextField!
    @IBOutlet weak var textureWorst: UITextField!
    @IBOutlet weak var perimeterWorst: UITextField!
    @IBOutlet weak var areaWorst: UITextField!
    @IBOutlet weak var smoothnessWorst: UITextField!
    @IBOutlet weak var compactnessWorst: UITextField!
    @IBOutlet weak var concavityWorst: UITextField!
    @IBOutlet weak var concavePointsWorst: UITextField!
    @IBOutlet weak var symmetryWorst: UITextField!
    @IBOutlet weak var fractulDimensionWorst: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func detect(){
        let model = breast_cancer()
        let adiusMean = Double(radiusMean.text!) ?? 14.127
        let extureMean = Double(textureMean.text!) ?? 19.2896
        let erimeterMean = Double(perimeterMean.text!) ?? 91.969
        let reaMean = Double(areaMean.text!) ?? 654.889
        let moothnessMean = Double(smoothnessMean.text!) ?? 0.0963
        let ompactnessMean = Double(compactnessMean.text!) ?? 0.104
        let oncavityMean = Double(concavityMean.text!) ?? 0.0887
        let oncavePointsMean = Double(concavePointsMean.text!) ?? 0.0489
        let ymmetryMean = Double(symmetryMean.text!) ?? 0.1811
        let ractulDimesionMean = Double(fractulDimensionMean.text!) ?? 0.0627
        let adiusSe = Double(radiusSe.text!) ?? 0.405
        let extureSe = Double(textureSe.text!) ?? 1.216
        let erimeterSe = Double(perimeterSe.text!) ?? 2.866
        let reaSe = Double(areaSe.text!) ?? 40.337
        let moothnessSe = Double(smoothnessSe.text!) ?? 0.0070
        let ompactnessSe = Double(compactnessSe.text!) ?? 0.0254
        let oncavitySe = Double(concavitySe.text!) ?? 0.032
        let oncavePointSe = Double(concavePointsSe.text!) ?? 0.011
        let ymmetrySe = Double(symmetrySe.text!) ?? 0.02
        let ractulDimensionSe = Double(fractulDimensionSe.text!) ?? 0.0037
        let adiusWorst = Double(radiusWorst.text!) ?? 16.269
        let extureWorst = Double(textureWorst.text!) ?? 25.677
        let erimeterWorst = Double(perimeterWorst.text!) ?? 107.261
        let reaWorst = Double(areaWorst.text!) ?? 880.583
        let moothnesWorst = Double(smoothnessWorst.text!) ?? 0.132
        let ompactnessWorst = Double(compactnessWorst.text!) ?? 0.254
        let oncavityWorst = Double(concavityWorst.text!) ?? 0.272
        let oncavePointWorst = Double(concavePointsWorst.text!) ?? 0.114
        let ymmetryWorst = Double(symmetryWorst.text!) ?? 0.290
        let ractulDimensionWorst = Double(fractulDimensionWorst.text!) ?? 0.0839
        
        guard let output = try? model.prediction(radius_mean: adiusMean, texture_mean: extureMean, perimeter_mean: erimeterMean, area_mean: reaMean, smoothness_mean: moothnessMean, compactness_mean: ompactnessMean, concavity_mean: oncavityMean, concave_points_mean: oncavePointsMean, symmetry_mean: ymmetryMean, fractal_dimension_mean: ractulDimesionMean, radius_se: adiusSe, texture_se: extureSe, perimeter_se: erimeterSe, area_se: reaSe, smoothness_se: moothnessSe, compactness_se: ompactnessSe, concavity_se: oncavitySe, concave_points_se: oncavePointSe, symmetry_se: ymmetrySe, fractal_dimension_se: ractulDimensionSe, radius_worst: adiusWorst, texture_worst: extureWorst, perimeter_worst: erimeterWorst, area_worst: reaWorst, smoothness_worst: moothnesWorst, compactness_worst: ompactnessWorst, concavity_worst: oncavityWorst, concave_points_worst: oncavePointWorst, symmetry_worst: ymmetryWorst, fractal_dimension_worst: ractulDimensionWorst) else{
            fatalError("Input Failed")
        }
        let result = output.target
        self.navigationItem.title = "\(result)"
        print(result)
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
          detect()
    }
}
