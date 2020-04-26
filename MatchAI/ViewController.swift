//
//  ViewController.swift
//  MatchAI
//
//  Created by Sashank Vempati on 4/25/20.
//  Copyright © 2020 Sashank Vempati. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        
        let db = Firestore.firestore()
        db.collection("cars").addDocument(data: ["Make" : "Lamborghini", "Model": "458"])

    }
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }

    
}

