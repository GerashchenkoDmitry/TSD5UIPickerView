//
//  GenderPicker.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 03.02.2022.
//

import UIKit

final class GenderTextField: UITextField {
    private let genderPickerData = ["Male", "Female"]
}

extension GenderTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(genderPickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = genderPickerData[row]
    }
}
