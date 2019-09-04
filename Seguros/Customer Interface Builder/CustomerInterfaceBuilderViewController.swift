//
//  CustomerInterfaceBuilderViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2019-09-02.
//  Copyright © 2019 Mauricio Esteves. All rights reserved.
//

import UIKit

/** ViewController for List of Customers using InterfaceBuilder */
class CustomerInterfaceBuilderViewController: UIViewController {
    
    @IBOutlet weak var customersTableView: UITableView!
    
    private var indexPath: IndexPath!
    
    private var customers: [Customer]!
    private var expandedCells: [IndexPath: CustomerInterfaceBuilderTableViewCell] = [:]
    
    init(_ customers: [Customer]!) {
        super.init(nibName: "CustomerInterfaceBuilderViewController", bundle: nil)
        self.customers = customers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customersTableView.register(UINib(nibName: "CustomerInterfaceBuilderTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomerInterfaceBuilderTableViewCell")
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CustomerInterfaceBuilderViewController: UITableViewDataSource, UITableViewDelegate {
    
    /** Called to retrieve the number of sections in the table view. */
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /** Called to retrieve the number of rows for a given section. */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return customers.count
    }
    
    /** Called to retrieve the item for a given index path. */
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInterfaceBuilderTableViewCell", for: indexPath) as? CustomerInterfaceBuilderTableViewCell {
            
            guard let customers = customers else {
                return UITableViewCell()
            }
            
            let customer = customers[indexPath.item]
            cell.delegate = self
            cell.update(customer, indexPath, expanded: expandedCells[indexPath] != nil)
            
            return cell
        }
        return UITableViewCell()
    }
    
    /** Called to retrieve the height of the item for the specified index path. */
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedCells[indexPath] != nil {
            return CustomerInterfaceBuilderTableViewCell.expandedCellHeight
        }
        return UITableViewAutomaticDimension
    }
}

extension CustomerInterfaceBuilderViewController: CustomerInterfaceBuilderTableViewCellDelegate {
    
    /** Update the dictionary containing the indexPath and the cell and reload the touched row */
    func customerInterfaceBuilderTableViewCellDidTouchExpandButton(_ cell: CustomerInterfaceBuilderTableViewCell, expanded: Bool!, indexPath: IndexPath?) {
        
        guard let indexPath = indexPath else {
            return
        }
        
        //needed to update the row height when reloading the row
        if expanded {
            expandedCells[indexPath] = cell
        } else {
            expandedCells[indexPath] = nil
        }
        
        //update tableview row height and properties
        customersTableView.reloadRows(at: [indexPath], with: .fade)
    }
}
