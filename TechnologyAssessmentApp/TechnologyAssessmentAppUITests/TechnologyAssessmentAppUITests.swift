//
//  TechnologyAssessmentAppUITests.swift
//  TechnologyAssessmentAppUITests
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest

class TechnologyAssessmentAppUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test.
        //   Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state -
        // such as interface orientation - required for your tests
        // before they run. The setUp method is a good place to do this.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testTableInteraction() {
        // Assert that we are displaying the tableview
        let articleTableView = XCUIApplication().tables["table--articleTableView"]
        XCTAssertTrue(articleTableView.exists, "The article tableview exists")
        // Get an array of cells
        let tableCells = articleTableView.cells
        print("Count of table cells \(tableCells.count)")
        sleep(10)
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            let promise = self.expectation(description: "Wait for table cells")
            for index in stride(from: 0, to: count, by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: index)
                XCTAssertTrue(tableCell.exists, "The \(index) cell is in place on the table")
                // Does this actually take us to the next screen
                tableCell.tap()
                if index == (count - 1) {
                    promise.fulfill()
                }
                // Back
                XCUIApplication().navigationBars.buttons.element(boundBy: 0).tap()
            }
            self.waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
