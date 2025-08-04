//
//  ContentView.swift
//  MyOkashi
//
//  Created by 原田佳祐 on 2025/08/04.
//

import SwiftUI

struct ContentView: View {
    var okashiDataList = OkashiData()
    @State var inputText: String = ""
    var body: some View {
        VStack {
            TextField("キーワード",
            text: $inputText,
            prompt: Text("キーワードを入力してください"))
            .onSubmit {
                okashiDataList.searchOkashi(keyword: inputText)
            }
        }
    }
}

#Preview {
    ContentView()
}
