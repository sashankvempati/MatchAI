//
//  UserPhysicalViewController.swift
//  MatchAI
//
//  Created by Sashank Vempati on 4/26/20.
//  Copyright © 2020 Sashank Vempati. All rights reserved.
//

import UIKit
import Firebase

class UserPhysicalViewController: UIViewController {

    @IBOutlet weak var collegeField: UITextField!
    @IBOutlet weak var AgeValue: UILabel!
    @IBOutlet weak var AgeSlider: UISlider!
    @IBOutlet weak var HeightValue: UILabel!
    @IBOutlet weak var HeightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let savedAge = UserDefaults.standard.integer(forKey: "AgeValue")
        let savedHeight = UserDefaults.standard.integer(forKey: "HeightValue")
        
        AgeValue.text = String(savedAge)
        HeightValue.text = String(savedHeight)
        
        AgeSlider.setValue(Float(savedAge), animated: true)
        HeightSlider.setValue(Float(savedHeight), animated: true)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func ageSlider(_ sender: UISlider) {
        AgeValue.text = String(Int(sender.value))
        
        UserDefaults.standard.set(AgeValue.text, forKey: "AgeValue")
        UserDefaults.standard.set(AgeSlider.currentThumbImage, forKey: "AgeValuePos")
        
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        HeightValue.text = String(Int(sender.value))
        
        UserDefaults.standard.set(HeightValue.text, forKey: "HeightValue")
        UserDefaults.standard.set(HeightSlider.currentThumbImage, forKey: "HeightValuePos")
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        
        let documentUid = UserDefaults.standard.string(forKey: "uid")
        let dataReference = Firestore.firestore().collection("users").document(documentUid!)
        let data = [
            "document UID": documentUid!,
            "College": collegeField.text!,
            "Age": AgeValue.text!,
            "Height": HeightValue.text!
            ] as [String : Any]
        dataReference.setData(data, merge: true) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            
        }


        
        
        
        
    }
    
    
}
