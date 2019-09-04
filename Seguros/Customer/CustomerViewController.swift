//
//  ViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import UIKit

/** ViewController for List of Customers using Coding Constraints */
class CustomerViewController: UIViewController {

    /** Properties */
    public static var displayWidth: CGFloat = 130.0
    public static var padding: CGFloat = 20.0
    
    fileprivate let cellId = "cellId"
    fileprivate var customers: [Customer]?
    
    public lazy var tableView: UITableView = {
        
        let tableView                = UITableView()
        tableView.dataSource         = self
        tableView.delegate           = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight          = UITableViewAutomaticDimension
        tableView.backgroundColor    = UIColor.white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CustomerTableViewCell.self, forCellReuseIdentifier: cellId)
        
        return tableView
    }()
    
    // MARK: - Init
    public init(_ customers: [Customer]!) {
        super.init(nibName: nil, bundle: nil)
        
        self.customers = customers
        
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        addConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func navigation(_ customerViewController: UIViewController) -> UINavigationController {
        let controller                    = UINavigationController(rootViewController: customerViewController)
        controller.navigationBar.isHidden = true
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func addConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: CustomerViewController.padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CustomerViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CustomerTableViewCell {
            //customer id
            let cpfCnpj   = customers?[indexPath.item].cpf != "" ? customers?[indexPath.item].cpf : customers?[indexPath.item].cnpj
            
            let name      = customers?[indexPath.item].nome
            let company   = customers?[indexPath.item].seguradora
            let carPlate  = customers?[indexPath.item].placa
            let startDate = customers?[indexPath.item].vigenciaInicio
            let endDate   = customers?[indexPath.item].vigenciaFim
            
            cell.update(name, id: cpfCnpj, company: company, carPlate: carPlate, period: "\(startDate ?? "NA") - \(endDate ?? "NA")")
            
            return cell
        }
        
        return UITableViewCell()
    }
}
