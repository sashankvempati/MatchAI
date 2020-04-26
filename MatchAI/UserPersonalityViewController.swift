//
//  UserPersonalityViewController.swift
//  MatchAI
//
//  Created by Sashank Vempati on 4/26/20.
//  Copyright © 2020 Sashank Vempati. All rights reserved.
//

import UIKit
import Firebase

class UserPersonalityViewController: UIViewController {

    
    @IBOutlet weak var zodiac: UITextField!
    
    @IBOutlet weak var MB: UITextField!
    
    @IBOutlet weak var s1: UISlider!
    @IBOutlet weak var s2: UISlider!
    @IBOutlet weak var s3: UISlider!
    @IBOutlet weak var s4: UISlider!
    @IBOutlet weak var s5: UISlider!
    @IBOutlet weak var s6: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let saved1 = UserDefaults.standard.integer(forKey: "senseOfHumor")
        let saved2 = UserDefaults.standard.integer(forKey: "sponteneity")
        let saved3 = UserDefaults.standard.integer(forKey: "pets")
        let saved4 = UserDefaults.standard.integer(forKey: "money")
        let saved5 = UserDefaults.standard.integer(forKey: "temperament")
        let saved6 = UserDefaults.standard.integer(forKey: "political")
        
        s1.setValue(Float(saved1), animated: true)
        s2.setValue(Float(saved2), animated: true)
        s3.setValue(Float(saved3), animated: true)
        s4.setValue(Float(saved4), animated: true)
        s5.setValue(Float(saved5), animated: true)
        s6.setValue(Float(saved6), animated: true)

    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func senseOfHumorSlider(_ sender: UISlider) {
        let senseOfHumor = String(Int(sender.value))
        UserDefaults.standard.set(senseOfHumor, forKey: "senseOfHumor")
    }
    @IBAction func sponteneitySlider(_ sender: UISlider) {
        let sponteneity = String(Int(sender.value))
        UserDefaults.standard.set(sponteneity, forKey: "sponteneity")
    }
    @IBAction func PetsSlider(_ sender: UISlider) {
        let pets = String(Int(sender.value))
        UserDefaults.standard.set(pets, forKey: "pets")
    }
    @IBAction func MoneySlider(_ sender: UISlider) {
        let money = String(Int(sender.value))
        UserDefaults.standard.set(money, forKey: "money")

    }
    @IBAction func TemperamentSlider(_ sender: UISlider) {
        let temperament = String(Int(sender.value))
        UserDefaults.standard.set(temperament, forKey: "temperament")

    }
    @IBAction func PoliticalSlider(_ sender: UISlider) {
        let political = String(Int(sender.value))
        UserDefaults.standard.set(political, forKey: "political")

    }
    
    
    @IBAction func done(_ sender: Any) {
        //save to firebase
        let documentUid = UserDefaults.standard.string(forKey: "uid")
        let dataReference = Firestore.firestore().collection("users").document(documentUid!)
        
        let saved1 = UserDefaults.standard.integer(forKey: "senseOfHumor")
        let saved2 = UserDefaults.standard.integer(forKey: "sponteneity")
        let saved3 = UserDefaults.standard.integer(forKey: "pets")
        let saved4 = UserDefaults.standard.integer(forKey: "money")
        let saved5 = UserDefaults.standard.integer(forKey: "temperament")
        let saved6 = UserDefaults.standard.integer(forKey: "political")

        
        let data = [
            "document UID": documentUid!,
            "Sense of Humor": saved1,
            "Sponteneity": saved2,
            "Pets": saved3,
            "Money": saved4,
            "Temperament": saved5,
            "Political Affiliation": saved6,
            "Zodiac Sign": zodiac.text ?? "",
            "Myers Briggs": MB.text ?? ""
            ] as [String : Any]
        dataReference.setData(data, merge: true) { (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            
        }

    }
    
}
