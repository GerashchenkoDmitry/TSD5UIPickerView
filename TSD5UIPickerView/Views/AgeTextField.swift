//
//  AgeTextField.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 03.02.2022.
//

import UIKit

final class AgeTextField: UITextField {
    private let ageDataSource = Array(1...120)
}

extension AgeTextField: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ageDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(ageDataSource[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = "\(ageDataSource[row])"
    }
}
