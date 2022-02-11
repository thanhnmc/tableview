//
//  FooterTableViewCell.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class FooterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var goBackToSetting:(() -> Void)?

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        self.goBackToSetting?()
    }
    
}
