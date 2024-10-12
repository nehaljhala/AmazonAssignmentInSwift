//
//  AmazonAppAssignmentTests.swift
//  AmazonAppAssignmentTests
//
//  Created by Nehal Jhala on 10/2/24.
//

import XCTest
@testable import AmazonAppAssignment

// unit and ui tests:
class ViewControllerTests: XCTestCase {
    let viewController = ViewController()
    
    func testLoadWebView() {
        // Assert that the web view's URL request matches the expected URL
        XCTAssertEqual(viewController.homeURL, URL(string: "https://www.amazon.com"),"The url is same")
        XCTAssertNotNil(viewController.homeURL, "the url is not nil")
    }
        
    func testLinkStactCount() {
        XCTAssertEqual(viewController.linkTitles.count, 5)
    }
    
}


