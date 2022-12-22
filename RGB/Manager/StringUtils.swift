//
//  StringUtils.swift
//  RGB
//
//  Created by 박준하 on 2022/12/22.
//

import Foundation
import Then

public class StringUtils {
    public static let numberFormatter = NumberFormatter().then { format in
        format.numberStyle = .decimal
    }
    
    public static let paragraphStyle = NSMutableParagraphStyle().then { paragraph in
        paragraph.lineSpacing = 20
    }
}

extension Int {
    func toDigitString() -> String {
        return StringUtils.numberFormatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    func toAttributeText() -> NSAttributedString {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.paragraphStyle, value: StringUtils.paragraphStyle, range: NSMakeRange(0, str.length))
        return str
    }
}
