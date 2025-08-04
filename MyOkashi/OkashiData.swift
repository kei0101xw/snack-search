//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 原田佳祐 on 2025/08/04.
//

import SwiftUI

@Observable class OkashiData {
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
        }
        let Item: [Item]?
    }
    
    func searchOkashi(keyword: String) {
        
        Task {
            await search(keyword: keyword)
        }
    }
    
    private func search(keyword: String) async {
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: req_url)
            let decoder = JSONDecoder()
            let json = try decoder.decode(ResultJson.self, from: data)
            print(json)
        } catch {
            print("エラーが出ました")
        }
    }
}
