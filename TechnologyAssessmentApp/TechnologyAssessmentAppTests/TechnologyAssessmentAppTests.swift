//
//  TechnologyAssessmentAppTests.swift
//  TechnologyAssessmentAppTests
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import XCTest
import SDWebImage
import MBProgressHUD
@testable import TechnologyAssessmentApp

// swiftlint:disable line_length
class TechnologyAssessmentAppTests: XCTestCase {
    var viewControllerUnderTest: MasterTableViewController?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "MasterTableViewController") as? MasterTableViewController
        viewControllerUnderTest?.loadView()
        viewControllerUnderTest?.viewDidLoad()
        viewControllerUnderTest?.fetchArticleList()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest?.tableView)
    }
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest?.tableView.delegate)
    }
    func testTableViewConfromsToTableViewDelegateProtocol() {
        if let vct = viewControllerUnderTest {
            XCTAssertTrue((vct.conforms(to: UITableViewDelegate.self)))
            XCTAssertTrue(vct.responds(to: #selector(vct.tableView(_:didSelectRowAt:))))
        }
    }
    func testTableViewHasDataSource() {
       // XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
        //XCTAssertNotNil(viewControllerUnderTest?.tableDataSource)

    }
    func testTableViewConformsToTableViewDataSourceProtocol() {
        if let vct = viewControllerUnderTest {
            XCTAssertTrue(vct.conforms(to: UITableViewDataSource.self))
            XCTAssertTrue(vct.responds(to: #selector(vct.numberOfSections(in:))))
            XCTAssertTrue(vct.responds(to: #selector(vct.tableView(_:numberOfRowsInSection:))))
            XCTAssertTrue(vct.responds(to: #selector(vct.tableView(_:cellForRowAt:))))
        }
    }
    func testTableViewCellHasReuseIdentifier() {
//        if let vct = viewControllerUnderTest {
//            if vct.tableDataSource.isEmpty == false {
//                let cell = vct.tableView(vct.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ArticleTableViewCell
//                let actualReuseIdentifer = cell?.reuseIdentifier
//                let expectedReuseIdentifier = "ArticleTableViewCell"
//                XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
//            }
//        }
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
