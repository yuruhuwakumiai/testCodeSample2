//
//  TestCode2Tests.swift
//  TestCode2Tests
//
//  Created by 橋元雄太郎 on 2023/05/24.
//

import XCTest
@testable import TestCode2 // アプリの名前に置き換えてください

class MemoAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAddMemo() throws {
        let app = XCUIApplication()
        app.launch()

        // 新しいメモを入力
        let textField = app.textFields["新しいメモを追加"]
        XCTAssertTrue(textField.exists)
        textField.tap()
        textField.typeText("テストメモ")
        app.buttons["追加"].tap()

        // 追加されたメモが表示されていることを確認
        let addedMemo = app.staticTexts["テストメモ"]
        XCTAssertTrue(addedMemo.exists)
    }
}
