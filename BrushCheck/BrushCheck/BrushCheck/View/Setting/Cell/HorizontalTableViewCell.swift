//
//  HorizontalTableViewCell.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class HorizontalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [[String]] = [[String]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inputData()
    }

    private func inputData() {
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = MeasuringPosition.ew0800Horizontal.getListThreshold()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(minimumIndex: Int, maximumIndex: Int) {
        self.picker.selectRow(minimumIndex, inComponent: 0, animated: true)
        self.picker.selectRow(maximumIndex, inComponent: 1, animated: true)
    }
    
    var selectedValueInPicker: (([Double]) -> Void)?

}

//MARK: UIPickerView Delegate
extension HorizontalTableViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minValue = pickerData[0][pickerView.selectedRow(inComponent: 0)]
        let maxValue = pickerData[1][pickerView.selectedRow(inComponent: 0)]
        if let doubleMinValue = Double(minValue), let doubleMaxValue = Double(maxValue) {
            self.selectedValueInPicker?([doubleMinValue, doubleMaxValue])
        }
    }
}

//MARK: UIPickerView DataSource
extension HorizontalTableViewCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[0].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
}
