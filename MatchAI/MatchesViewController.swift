//
//  MatchesViewController.swift
//  
//
//  Created by Sashank Vempati on 4/26/20.
//

import UIKit

class MatchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var matchesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        matchesList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchesList.dequeueReusableCell(withIdentifier: "MatchesTableViewCell", for: indexPath)
        
        return cell

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
