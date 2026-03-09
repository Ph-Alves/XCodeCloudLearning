//
//  LearningXCodeCloudUITests.swift
//  LearningXCodeCloudUITests
//
//  Created by Paulo Henrique Costa Alves on 07/03/26.
//

import XCTest

final class LearningXCodeCloudUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    @MainActor
    func testNavigationTitleExists() {
        XCTAssertTrue(app.navigationBars["To-Do List"].exists)
    }

    private func addTodo(_ title: String) {
        let textField = app.textFields["Nova tarefa"]
        XCTAssertTrue(textField.waitForExistence(timeout: 3))
        textField.tap()
        sleep(1)
        textField.typeText("\(title)\n")
    }

    @MainActor
    func testAddTodo() {
        addTodo("Estudar CI/CD")
        XCTAssertTrue(app.staticTexts["Estudar CI/CD"].waitForExistence(timeout: 3))
    }

    @MainActor
    func testAddButtonDisabledWhenEmpty() {
        let addButton = app.buttons["Adicionar"]
        XCTAssertTrue(addButton.waitForExistence(timeout: 3))
        XCTAssertFalse(addButton.isEnabled)
    }

    @MainActor
    func testToggleTodo() {
        addTodo("Tarefa toggle")
        let circleButton = app.buttons["circle"]
        XCTAssertTrue(circleButton.waitForExistence(timeout: 3))
        circleButton.tap()
        XCTAssertTrue(app.buttons["checkmark.circle.fill"].waitForExistence(timeout: 3))
    }

    @MainActor
    func testDeleteTodo() {
        addTodo("Tarefa deletar")
        let cell = app.staticTexts["Tarefa deletar"]
        XCTAssertTrue(cell.waitForExistence(timeout: 3))
        cell.swipeLeft()
        app.buttons["Delete"].tap()
        XCTAssertFalse(app.staticTexts["Tarefa deletar"].waitForExistence(timeout: 2))
    }
}
