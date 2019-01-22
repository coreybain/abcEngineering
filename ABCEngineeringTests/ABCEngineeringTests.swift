//
//  ABCEngineeringTests.swift
//  ABCEngineeringTests
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import XCTest
@testable import ABCEngineering

class ABCEngineeringTests: XCTestCase {

    var articles:[Article]?
    var loader = ArticleLoader()
    
    override func setUp() {
        
        loader.load { articles, error in
            if let uArticles = articles {
                self.articles = uArticles
                self.runAsyncTests()
            } else {
                // error not handled in this exercise
                fatalError()
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
    }
    
    func runAsyncTests() {
        XCTAssertNotNil(articles, "Articles arnt loading")
        if let art = articles {
            for article in art {
                XCTAssertNotNil(article.href, "Articles arnt loading")
            }
            XCTAssertTrue(articles!.count > 0)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
