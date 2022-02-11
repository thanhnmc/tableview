//
//  HeaderTableViewCell.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var setDefaultValue:(() -> Void)?
    
    @IBAction func defaultButotnTapped(_ sender: UIButton) {
        setDefaultValue?()
    }
    
}
