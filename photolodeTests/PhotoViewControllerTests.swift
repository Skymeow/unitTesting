//
//  PhotoViewControllerTests.swift
//  photolodeTests
//
//  Created by Sky Xu on 7/3/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import photolode

class PhotoViewControllerTests: XCTestCase {
    
    var sut: PhotoViewController!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
  
    func testPhotoDownload() {
        let expectedImgOrientation = UIImage(named: "pexels-photo-768218")?.imageOrientation
        
        guard let url = URL(string: imageURLStrings[3]) else { XCTFail(); return }
        let sessionExpectation = expectation(description: "Session")
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                XCTFail(err.localizedDescription)
            }
            if let data = data {
                guard let downloadedImg = UIImage(data: data) else { XCTFail(); return }
                sessionExpectation.fulfill()
                XCTAssertEqual(downloadedImg.imageOrientation, expectedImgOrientation)
            }
        }.resume()
        
        waitForExpectations(timeout: 12, handler: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
