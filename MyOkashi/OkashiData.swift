//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 原田佳祐 on 2025/08/04.
//

import SwiftUI

@Observable class OkashiData {
    func searchOkashi(keyword: String) {
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
        
        Task {
            await search(keyword: keyword)
        }
    }
    
    private func search(keyword: String) async {
        print("searchメソッドで受け取った値：\(keyword)")
    }
}
