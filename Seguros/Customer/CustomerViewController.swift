//
//  ViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {

    /** Properties */
    public static var displayWidth: CGFloat = 130.0
    public static var padding: CGFloat = 20.0
    
    fileprivate let cellId = "cellId"
    fileprivate var customers:[Customer]?
    
    /** The image view. */
    public let logoImageView: UIImageView = {
        
        let imageView                                       = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image                                     = UIImage(named: "EstevesCorretoraLogo")
        imageView.contentMode                               = .scaleAspectFit
        
        return imageView
    }()
    
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
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = UIColor.white
        view.addSubview(logoImageView)
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

        navigationItem.title = "REST API"
        
        //Implementing URLSession
        let urlString = "http://localhost:8080/customers/"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                let customersData = try JSONDecoder().decode([Customer].self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    //print(articlesData)
                    self.customers = customersData
                    self.tableView.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
        //End implementing URLSession
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func addConstraints() {
        
        guard let imageSize = logoImageView.image?.size else {
            return
        }
        
        let aspectRatio = imageSize.width/imageSize.height
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CustomerViewController.padding),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: CustomerViewController.displayWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: CustomerViewController.displayWidth/aspectRatio),
            
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: CustomerViewController.padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CustomerViewController: UITableViewDataSource {
    // MARK: - UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CustomerTableViewCell {
            let name      = customers?[indexPath.item].nome
            let cpfCnpj   = customers?[indexPath.item].cpf != "" ? customers?[indexPath.item].cpf : customers?[indexPath.item].cnpj
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

extension CustomerViewController: UITableViewDelegate {
    
}
