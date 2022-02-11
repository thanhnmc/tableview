//
//  SettingViewController.swift
//  BrushCheck
//
//  Created by nmcthanh on 08/02/2022.
//

import UIKit
enum TableSection: Int {
    case header = 0
    case ew0820Vertical
    case ew0800Vertical
    case ew0800Horizontal
    case footer
}

class SettingViewController: UIViewController {
    
    @IBOutlet weak var navController: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var resultew0820Vertical: ResultModel = ResultModel(maxThreshold: "0.50", minThreshold: "0.40")
    var resultew0800Vertical: ResultModel = ResultModel(maxThreshold: "0.50", minThreshold: "0.40")
    var resultew0800Horizontal: ResultModel = ResultModel(maxThreshold: "9.00", minThreshold: "8.50")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "VerticalTableViewCell", bundle: nil), forCellReuseIdentifier: "VerticalTableViewCell")
        self.tableView.register(UINib(nibName: "HorizontalTableViewCell", bundle: nil), forCellReuseIdentifier: "HorizontalTableViewCell")
        self.tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        self.tableView.register(UINib(nibName: "FooterTableViewCell", bundle: nil), forCellReuseIdentifier: "FooterTableViewCell")
        self.configUI()
    }

    private func configUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    var getResult: (() -> Void)?
}

//MARK: UITableView delegate
extension SettingViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.footer.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSection = TableSection(rawValue: indexPath.section)
        switch tableSection {
        case .header:
            return 80
        case .ew0820Vertical,.ew0800Horizontal,.ew0800Vertical:
            return 200
        default:
            return 150
        }
    }
}

//MARK: UITableView DataSource
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = TableSection(rawValue: indexPath.section)
        switch tableSection {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else { return UITableViewCell() }
            
            cell.setDefaultValue = {
                UserDefaults.standard.removeObject(forKey: "ew0820VerticalMin")
                UserDefaults.standard.removeObject(forKey: "ew0820VerticalMax")
                UserDefaults.standard.removeObject(forKey: "ew0800VerticalMin")
                UserDefaults.standard.removeObject(forKey: "ew0800VerticalMax")
                UserDefaults.standard.removeObject(forKey: "ew0800HorizontalMin")
                UserDefaults.standard.removeObject(forKey: "ew0800HorizontalMax")

                tableView.reloadData()
            }
            
            return cell
        case .ew0820Vertical:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalTableViewCell", for: indexPath) as? VerticalTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = MeasuringPosition.ew0820Vertical.getTitle()
            
            let data = MeasuringPosition.thresholdVertical
            var minimumIndex = data.firstIndex(where: {$0 == self.resultew0820Vertical.minThreshold})!
            var maximumIndex = data.firstIndex(where: {$0 == self.resultew0820Vertical.maxThreshold})!
            let minValue = UserDefaults.standard.double(forKey: "ew0820VerticalMin")
            let maxValue = UserDefaults.standard.double(forKey: "ew0820VerticalMax")
            
            if let minSelectedIndex = data.firstIndex(where: {$0 == String(minValue)}) {
                minimumIndex = minSelectedIndex
            }
            if let maxSelectedIndex = data.firstIndex(where: {$0 == String(maxValue)}) {
                maximumIndex = maxSelectedIndex
            }
            
            cell.setValue(minimumIndex: minimumIndex, maximumIndex: maximumIndex)
            
            cell.selectedValueInPicker = { minMaxValue in
                let minValue = minMaxValue[0]
                let maxValue = minMaxValue[1]
                UserDefaults.standard.set(Double(minValue), forKey: "ew0820VerticalMin")
                UserDefaults.standard.set(Double(maxValue), forKey: "ew0820VerticalMax")
            }
            return cell
        case .ew0800Vertical:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalTableViewCell", for: indexPath) as? VerticalTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = MeasuringPosition.ew0800Vertical.getTitle()
            let data = MeasuringPosition.thresholdVertical
            var minimumIndex = data.firstIndex(where: {$0 == self.resultew0800Vertical.minThreshold})!
            var maximumIndex = data.firstIndex(where: {$0 == self.resultew0800Vertical.maxThreshold})!
            let minValue = UserDefaults.standard.double(forKey: "ew0800VerticalMin")
            let maxValue = UserDefaults.standard.double(forKey: "ew0800VerticalMax")
            
            if let minSelectedIndex = data.firstIndex(where: {$0 == String(minValue)}) {
                minimumIndex = minSelectedIndex
            }
            if let maxSelectedIndex = data.firstIndex(where: {$0 == String(maxValue)}) {
                    maximumIndex = maxSelectedIndex
            }
            cell.setValue(minimumIndex: minimumIndex, maximumIndex: maximumIndex)
            
            cell.selectedValueInPicker = { minMaxValue in
                let minValue = minMaxValue[0]
                let maxValue = minMaxValue[1]
                UserDefaults.standard.set(Double(minValue), forKey: "ew0800VerticalMin")
                UserDefaults.standard.set(Double(maxValue), forKey: "ew0800VerticalMax")
            }
            return cell
        case .ew0800Horizontal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalTableViewCell", for: indexPath) as? HorizontalTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = MeasuringPosition.ew0800Horizontal.getTitle()
            let data = MeasuringPosition.threshholdHorizontal
            var minimumIndex = data.firstIndex(where: {$0 == self.resultew0800Horizontal.minThreshold})!
            var maximumIndex = data.firstIndex(where: {$0 == self.resultew0800Horizontal.maxThreshold})!
            let minValue = UserDefaults.standard.double(forKey: "ew0800HorizontalMin")
            let maxValue = UserDefaults.standard.double(forKey: "ew0800HorizontalMax")
            
            if let minSelectedIndex = data.firstIndex(where: {$0 == String(minValue)}) {
                minimumIndex = minSelectedIndex
            }
            if let maxSelectedIndex = data.firstIndex(where: {$0 == String(maxValue)}) {
                    maximumIndex = maxSelectedIndex
            }
            cell.setValue(minimumIndex: minimumIndex, maximumIndex: maximumIndex)
            
            cell.selectedValueInPicker = { minMaxValue in
                let minValue = minMaxValue[0]
                let maxValue = minMaxValue[1]
                UserDefaults.standard.set(Double(minValue), forKey: "ew0800HorizontalMin")
                UserDefaults.standard.set(Double(maxValue), forKey: "ew0800HorizontalMax")
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell", for: indexPath) as? FooterTableViewCell else { return UITableViewCell() }
            cell.goBackToSetting = { [weak self] in
                if (self?.resultew0820Vertical.minThreshold)! > (self?.resultew0820Vertical.maxThreshold)! || (self?.resultew0820Vertical.minThreshold)! > (self?.resultew0820Vertical.maxThreshold)! || (self?.resultew0820Vertical.minThreshold)! > (self?.resultew0820Vertical.maxThreshold)! {
                    let alert = UIAlertController(title: "Inputted threshold invalid", message: "The maximum threshold must be greater than minimum threshold.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                } else {
                    self?.dismiss(animated: false, completion: {
                        self?.getResult?()
                        }
                    )
                }
            }
            return cell
        }
    }
}
