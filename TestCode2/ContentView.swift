//
//  ContentView.swift
//  TestCode2
//
//  Created by 橋元雄太郎 on 2023/05/24.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var content: String
}

struct ContentView: View {
    @State private var memoList: [Memo] = []
    @State private var newMemoContent = ""

    var body: some View {
        VStack {
            HStack {
                TextField("新しいメモを追加", text: $newMemoContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addMemo) {
                    Text("追加")
                }
            }
            List(memoList) { memo in
                Text(memo.content)
            }
        }
        .padding()
    }

    func addMemo() {
        guard !newMemoContent.isEmpty else { return }
        let memo = Memo(content: newMemoContent)
        memoList.append(memo)
        newMemoContent = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

