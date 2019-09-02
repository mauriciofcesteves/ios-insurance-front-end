//
//  MainViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2019-09-02.
//  Copyright © 2019 Mauricio Esteves. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func listOfCustomersAutoLayoutTouched(_ sender: Any) {
        let viewControllerWithNavigation = UINavigationController(rootViewController: CustomerViewController())
        self.present(viewControllerWithNavigation, animated: true, completion: nil)
    }
}
