//
//  LearningXCodeCloudUITestsLaunchTests.swift
//  LearningXCodeCloudUITests
//
//  Created by Paulo Henrique Costa Alves on 07/03/26.
//

import XCTest

final class LearningXCodeCloudUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
//        let app = XCUIApplication()
//        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
    }
}
