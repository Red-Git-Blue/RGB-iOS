//
//  BaseVM.swift
//  RGB
//
//  Created by 박준하 on 2022/12/11.
//

import Foundation

protocol BaseVM {
    associatedtype Input
    associatedtype Output

    func trans(_ input: Input) -> Output
}
