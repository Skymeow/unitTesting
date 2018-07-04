//
//  downloadClientTests.swift
//  photolodeTests
//
//  Created by Sky Xu on 7/3/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import photolode
class downloadClientTests: XCTestCase {
    
    var sut: DownloadClient!
    var mockURLSession: MockURLSession!
    override func setUp() {
        super.setUp()
        sut = DownloadClient()
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
    }
    
    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHost() {
        let imgURL = imageURLStrings[3]
        sut.downloadImage(withURL: imgURL)
        guard let url = URL(string: imgURL) else { XCTFail(); return }
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "encrypted-tbn0.gstatic.com")
    }
    
    func testPath() {
        let imgURL = imageURLStrings[3]
        sut.downloadImage(withURL: imgURL)
        guard let url = URL(string: imgURL) else { XCTFail(); return }
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.path, "/images")
    }
    
    
}
//    create a session to make sure url session works
//* create a instance of other's framework  and make it confirm to potocol, so you can use it as you wish
extension downloadClientTests {
    class MockURLSession: SessionProtocol {
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
        
        var url: URL?
        
        
    }
}
