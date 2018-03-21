//
//  CustomerTableViewCell.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import Foundation
import UIKit

open class CustomerTableViewCell: UITableViewCell {
    
    public static var padding: CGFloat    = 12.0
    public static var minPadding: CGFloat = 5.0
    
    /** The delete button */
    public lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        //        button.addTarget(self, action: #selector(productCollectionViewCellDidPressButton), for: .touchUpInside)
        return button
    }()
    
    /** The cell name label. */
    public lazy var nameLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.black
        label.numberOfLines                             = 1
        label.text                                      = "Nome"
        label.font                                      = CompareFonts.cellLabel
        
        return label
    }()
    
    /** The cell name value. */
    public lazy var nameValue: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.gray
        label.numberOfLines                             = 2
        label.font                                      = CompareFonts.cellValue
        
        return label
    }()
    
    /** The cell id label. */
    public lazy var idLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.black
        label.numberOfLines                             = 1
        label.text                                      = "CPF/CNPJ"
        label.font                                      = CompareFonts.cellLabel
        
        return label
    }()
    
    /** The cell id value. */
    public lazy var idValue: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.gray
        label.numberOfLines                             = 1
        label.font                                      = CompareFonts.cellValue
        
        return label
    }()
    
    /** The cell carPlate label. */
    public lazy var carPlateLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.black
        label.numberOfLines                             = 1
        label.text                                      = "Placa"
        label.font                                      = CompareFonts.cellLabel
        
        return label
    }()
    
    /** The cell carPlate value. */
    public lazy var carPlateValue: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.gray
        label.numberOfLines                             = 1
        label.font                                      = CompareFonts.cellValue
        
        return label
    }()
    
    /** The cell period label. */
    public lazy var periodLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.black
        label.numberOfLines                             = 1
        label.text                                      = "Vigencia"
        label.font                                      = CompareFonts.cellLabel
        
        return label
    }()
    
    /** The cell period value. */
    public lazy var periodValue: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.gray
        label.numberOfLines                             = 1
        label.font                                      = CompareFonts.cellValue
        
        return label
    }()
    
    /** The cell company label. */
    public lazy var companyLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.black
        label.numberOfLines                             = 1
        label.text                                      = "Seguradora"
        label.font                                      = CompareFonts.cellLabel
        
        return label
    }()
    
    /** The cell company value. */
    public lazy var companyValue: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.gray
        label.numberOfLines                             = 2
        label.font                                      = CompareFonts.cellValue
        
        return label
    }()
    
    // MARK: - Init
    /**
     The view designated initializer.
     
     - parameter style: The cell style.
     
     - parameter reuseIdentifier: The reuseidentifer for the cell.
     */
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(deleteButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameValue)
        contentView.addSubview(idLabel)
        contentView.addSubview(idValue)
        contentView.addSubview(carPlateLabel)
        contentView.addSubview(carPlateValue)
        contentView.addSubview(periodLabel)
        contentView.addSubview(periodValue)
        contentView.addSubview(companyLabel)
        contentView.addSubview(companyValue)
        
        addConstraints()
    }
    
    /**
     Updates the Customer table view cell with data.
     
     - parameter name: An optional given to fill nameValue.
     
     - parameter id: An optional given to fill idValue.
     
     - parameter company: An optional given to fill companyValue.
     
     - parameter carPlate: An optional given to fill carPlateValue.
     
     - parameter period: An optional given to fill periodValue.
     */
    public func update(_ name: String?, id: String?, company: String?, carPlate: String?, period: String?) {
        nameValue.text     = name
        idValue.text       = id
        companyValue.text  = company
        carPlateValue.text = carPlate
        periodValue.text   = period
    }
    
    /**
     The designated initializer override.
     
     - parameter aDecoder: The coder instance given to the designated initializer.
     */
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addConstraints() {
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CustomerTableViewCell.padding),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CustomerTableViewCell.minPadding),
            deleteButton.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CustomerTableViewCell.padding),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            idValue.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            idValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            
            nameLabel.topAnchor.constraint(equalTo: idValue.bottomAnchor, constant: CustomerTableViewCell.padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            nameValue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            nameValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CustomerTableViewCell.minPadding),
            
            carPlateLabel.topAnchor.constraint(equalTo: nameValue.bottomAnchor, constant: CustomerTableViewCell.padding),
            carPlateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            carPlateValue.topAnchor.constraint(equalTo: carPlateLabel.bottomAnchor),
            carPlateValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            
            periodLabel.topAnchor.constraint(equalTo: nameValue.bottomAnchor, constant: CustomerTableViewCell.padding),
            periodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -92),
            periodValue.topAnchor.constraint(equalTo: carPlateLabel.bottomAnchor),
            periodValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CustomerTableViewCell.minPadding),
            
            companyLabel.topAnchor.constraint(equalTo: carPlateValue.bottomAnchor, constant: CustomerTableViewCell.padding),
            companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            companyValue.topAnchor.constraint(equalTo: companyLabel.bottomAnchor),
            companyValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CustomerTableViewCell.minPadding),
            companyValue.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
