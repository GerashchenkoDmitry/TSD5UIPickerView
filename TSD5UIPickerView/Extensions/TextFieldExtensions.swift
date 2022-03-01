//
//  TextFieldExtensions.swift
//  TSDProject5
//
//  Created by Дмитрий Геращенко on 01.02.2022.
//

import UIKit

extension UITextField {
    
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
