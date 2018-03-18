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
    
    /** The cell title label. */
    public lazy var nameLabel: UILabel = {
        
        let label                                       = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor                                 = UIColor.blue
        label.numberOfLines                             = 1
        
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
        contentView.addSubview(nameLabel)
        
        addConstraints()
    }
    
    /**
     Updates the Customer table view cell with data.
     
     - parameter name: An optional given to fill nameLabel.
     */
    public func update(_ name: String?) {
        nameLabel.text = name
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
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CustomerViewController.padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
    }
}
