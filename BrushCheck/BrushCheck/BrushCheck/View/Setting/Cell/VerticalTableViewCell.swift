//
//  VerticalTableViewCell.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {

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
        
        pickerData = MeasuringPosition.ew0820Vertical.getListThreshold()
    }
    
    func setValue(minimumIndex: Int, maximumIndex: Int) {
        self.picker.selectRow(minimumIndex, inComponent: 0, animated: true)
        self.picker.selectRow(maximumIndex, inComponent: 1, animated: true)
    }
    
    var selectedValueInPicker: (([Double]) -> Void)?
}

//MARK: UIPickerView Delegate
extension VerticalTableViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minValue = pickerData[0][pickerView.selectedRow(inComponent: 0)]
        let maxValue = pickerData[1][pickerView.selectedRow(inComponent: 1)]
        if let doubleMinValue = Double(minValue), let doubleMaxValue = Double(maxValue) {
            self.selectedValueInPicker?([doubleMinValue, doubleMaxValue])
        }
    }
}

//MARK: UIPickerView DataSource
extension VerticalTableViewCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
}
