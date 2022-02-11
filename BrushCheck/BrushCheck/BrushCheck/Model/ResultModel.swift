//
//  File.swift
//  BrushCheck
//
//  Created by nmcthanh on 11/02/2022.
//

import Foundation

class ResultModel {
    var minThreshold : String
    var maxThreshold : String
    
    init(maxThreshold: String, minThreshold: String) {
        self.minThreshold = minThreshold
        self.maxThreshold = maxThreshold
    }
}

enum MeasuringPosition {
    case ew0820Vertical
    case ew0800Vertical
    case ew0800Horizontal
    
    func getTitle() -> String {
        switch self {
        case .ew0820Vertical:
            return "EW0820 Vertical"
        case .ew0800Vertical:
            return "EW0800 & EW0801 Vertical"
        case .ew0800Horizontal:
            return "EW0800 & EW0801 Horizontal"
        }
    }
    
    static var thresholdVertical: [String] =
        ["0.05", "0.10", "0.15", "0.20", "0.25", "0.30", "0.35", "0.40", "0.45", "0.50", "0.55", "0.60", "0.65", "0.70", "0.75", "0.80"]
    
    static var threshholdHorizontal: [String] =
        ["7.50", "7.55", "7.60", "7.65", "7.70", "7.75", "7.80", "7.85", "7.90", "7.95", "8.00", "8.05", "8.10", "8.15", "8.20", "8.25", "8.30", "8.35", "8.40", "8.45", "8.50", "8.55", "8.60", "8.65", "8.70", "8.75", "8.80", "8.85", "8.90", "8.95", "9.00", "9.05", "9.10", "9.15", "9.20", "9.25", "9.30", "9.35", "9.40", "9.45", "9.50", "9.55", "9.60", "9.65", "9.70", "9.75", "9.80", "9.85", "9.90", "9.95", "10.00"]
    
    func getListThreshold() -> [[String]] {
        var data : [[String]] = [[String]]()
        switch self {
        case .ew0820Vertical:
            data = [MeasuringPosition.thresholdVertical,MeasuringPosition.thresholdVertical]
        case .ew0800Vertical:
            data = [MeasuringPosition.thresholdVertical,MeasuringPosition.thresholdVertical]
        case .ew0800Horizontal:
            data = [MeasuringPosition.threshholdHorizontal,MeasuringPosition.threshholdHorizontal]
        }
        return data
    }
}
