//
//  CustomerInterfaceBuilderTableViewCell.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2019-09-04.
//  Copyright © 2019 Mauricio Esteves. All rights reserved.
//

import UIKit

/** Delegate that handles the expanding and unexpanding row for each customer */
protocol CustomerInterfaceBuilderTableViewCellDelegate  {
    func customerInterfaceBuilderTableViewCellDidTouchExpandButton(_ cell: CustomerInterfaceBuilderTableViewCell, expanded: Bool!, indexPath: IndexPath?)
}

/** List of Customers using Interface Builder */
class CustomerInterfaceBuilderTableViewCell: UITableViewCell {

    public static let expandedCellHeight: CGFloat = 120
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expandDetailsButton: UIButton!
    @IBOutlet weak var stackViewDetails: UIStackView!
    @IBOutlet weak var carPlateLabel: UILabel!
    @IBOutlet weak var insuranceLabel: UILabel!
    
    private var customer: Customer!
    private var expanded = false
    private var indexPath: IndexPath?
    
    public var delegate: CustomerInterfaceBuilderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stackViewDetails.isHidden = true
    }

    /** Update the customer data and has the logic to handle the expand/unexpand each row */
    func update(_ customer: Customer!, _ indexPath: IndexPath, expanded: Bool!) {
        self.indexPath = indexPath
        self.customer = customer
        self.nameLabel.text = customer.nome
        self.carPlateLabel.text = customer.placa
        self.insuranceLabel.text = customer.seguradora
        
        if expanded {
            expandDetailsButton.setTitle("-", for: .normal)
            stackViewDetails.isHidden = false
        } else {
            expandDetailsButton.setTitle("+", for: .normal)
            stackViewDetails.isHidden = true
        }
        
        self.expanded = expanded
    }
    
    /** When the "plus" button is touched, do a delegate callback */
    @IBAction func expandDetailsTouched(_ sender: Any) {
        delegate?.customerInterfaceBuilderTableViewCellDidTouchExpandButton(self, expanded: !self.expanded, indexPath: self.indexPath)
    }
}
