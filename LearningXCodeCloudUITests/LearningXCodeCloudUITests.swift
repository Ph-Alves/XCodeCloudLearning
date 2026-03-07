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

    @MainActor
    func testAddTodo() {
        let textField = app.textFields["Nova tarefa"]
        textField.tap()
        textField.typeText("Estudar CI/CD")

        app.buttons["Adicionar"].tap()

        XCTAssertTrue(app.staticTexts["Estudar CI/CD"].exists)
        XCTAssertEqual(textField.label, "")
    }

    @MainActor
    func testAddButtonDisabledWhenEmpty() {
        let addButton = app.buttons["Adicionar"]
        XCTAssertFalse(addButton.isEnabled)
    }

    @MainActor
    func testToggleTodo() {
        let textField = app.textFields["Nova tarefa"]
        textField.tap()
        textField.typeText("Tarefa toggle")
        app.buttons["Adicionar"].tap()

        app.buttons["circle"].tap()

        XCTAssertTrue(app.buttons["checkmark.circle.fill"].exists)
    }

    @MainActor
    func testDeleteTodo() {
        let textField = app.textFields["Nova tarefa"]
        textField.tap()
        textField.typeText("Tarefa deletar")
        app.buttons["Adicionar"].tap()

        let cell = app.staticTexts["Tarefa deletar"]
        cell.swipeLeft()
        app.buttons["Delete"].tap()

        XCTAssertFalse(app.staticTexts["Tarefa deletar"].waitForExistence(timeout: 2))
    }
}
