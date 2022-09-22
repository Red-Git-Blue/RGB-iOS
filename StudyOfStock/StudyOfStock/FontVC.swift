//
//  FontVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/22.
//
//
//import Foundation
//import UIKit
//    
//enum FontSize: CGFloat {
//    case small = 12
//    case medium = 14
//    case large = 16
//    case extraLarge = 18
//}
//
//enum Font: Int {
//    case NanumGothic
//    case NanumGothicBold
//    case RobotoBlack
//    case RobotoRegular
//
//    /// 아이폰 작은 글씨(size: 12)
//    var smallFont: UIFont {
//        switch self {
//        case .NanumGothic:
//            return UIFont(name: "NanumGothic", size: FontSize.small.rawValue)!
//        case .NanumGothicBold:
//            return UIFont(name: "NanumGothicBold", size: FontSize.small.rawValue)!
//        case .RobotoBlack:
//            return UIFont(name: "Roboto-Black", size: FontSize.small.rawValue)!
//        case .RobotoRegular:
//            return UIFont(name: "Roboto-Regular", size: FontSize.small.rawValue)!
//        }
//    }
//
//}
//
//    let fontKey = "Font"
//
//    class SosFont {
//        /// 저장된 폰트 가져오기
//        static func getFont() -> Font {
//            if let font = (UserDefaults.standard.value(forKey: fontKey) as AnyObject).integerValue {
//                return Font(rawValue: font)!
//            } else {
//                // 저장된 폰트가 없으면 기본 폰트로
//                return Font.NanumGothic
//            }
//        }
//        /// 폰트 저장하기
//        static func setFont(font: Font) {
//            UserDefaults.standard.setValue(font.rawValue, forKey: fontKey)
//            UserDefaults.standard.synchronize()
//        }
//    }
