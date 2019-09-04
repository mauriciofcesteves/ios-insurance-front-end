//
//  MainViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2019-09-02.
//  Copyright © 2019 Mauricio Esteves. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var listOfCustomersInterfaceBuilderButton: UIButton!
    @IBOutlet weak var listOfCustomersAutolayoutButton: UIButton!
    
    fileprivate var customers: [Customer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        fetchCustomers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = ""
    }
    
    func setupUI() {
        listOfCustomersInterfaceBuilderButton.layer.borderWidth = 2
        listOfCustomersInterfaceBuilderButton.layer.borderColor = UIColor.black.cgColor
        
        listOfCustomersAutolayoutButton.layer.borderWidth = 2
        listOfCustomersAutolayoutButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func listOfCustomersInterfaceBuilderTouched(_ sender: Any) {
        if let customers = customers {
            navigationItem.title = "List of Customers (Interface Builder)"
            self.navigationController?.pushViewController(CustomerInterfaceBuilderViewController(customers), animated: true)
        }
    }
    
    @IBAction func listOfCustomersAutoLayoutTouched(_ sender: Any) {
        if let customers = customers {
            navigationItem.title = "List of Customers"
            self.navigationController?.pushViewController(CustomerViewController(customers), animated: true)
        }
    }
    
    /** Do a REST call to fetch the Customers */
    func fetchCustomers() {
        
        //Implementing URLSession
        let urlString = "http://localhost:8080/customers/"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let `self` = self else {
                return
            }
            
            if error != nil {
                print(error!.localizedDescription)
                
                guard let customers = self.loadCustomers() else {
                    print("Error loading local JSON")
                    return
                }
                
                self.updateCustomerDataTable(customers)
                return
            }
            
            guard let data = data else {
                return
            }
            
            //JSON decoding and parsing implementation
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let customersData = try JSONDecoder().decode([Customer].self, from: data)
                self.updateCustomerDataTable(customersData)
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
        //End of URLSession implementation
    }
    
    /** Load customers from local json */
    func loadCustomers() -> [Customer]? {
        
        var customers: [Customer]?
        if let path = Bundle.main.path(forResource: "customers", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let parsedCustomers = try JSONDecoder().decode([Customer].self, from: data)
                
                customers = []
                for parsedCustomer in parsedCustomers {
                    customers?.append(parsedCustomer)
                }
                
            } catch let jsonError {
                print("JSON decoder error: \(jsonError)")
            }
        }
        
        return customers
    }
    
    func updateCustomerDataTable(_ customers: [Customer]) {
        //Return to the main queue
        DispatchQueue.main.async {
            self.customers = customers
        }
    }
}
