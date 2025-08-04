//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 原田佳祐 on 2025/08/04.
//

import SwiftUI

@Observable class OkashiData {
    func searchOkashi(keyword: String) {
        print("searchOkashiメソッドで受け取った値：\(keyword)")
        
        Task {
            await search(keyword: keyword)
        }
    }
    
    private func search(keyword: String) async {
        print("searchメソッドで受け取った値：\(keyword)")
    }
}
