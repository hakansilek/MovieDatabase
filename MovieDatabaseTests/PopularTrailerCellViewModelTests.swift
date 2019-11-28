//
//  PopularTrailerCellViewModelTests.swift
//  MovieDatabaseTests
//
//  Created by Hakan Silek on 25.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import XCTest
@testable import MovieDatabase
class PopularTrailerCellViewModelTests: XCTestCase {
    
    private var mockView: MockPopularTrailerCellView!
    private var viewModel: PopularTrailerCellViewModel!
    private var dataId = "populartrailer1"
    override func setUp() {
        viewModel = PopularTrailerCellViewModel(dataId: dataId)
        mockView = MockPopularTrailerCellView()
        viewModel.delegate = mockView
    }
    
    func testLoad() {
        viewModel.load()
        
        XCTAssertEqual(mockView.outputs.count, 3, "outputs array count must be 3")
        XCTAssertEqual(mockView.loadingList.count, 2, "loadingList array count must be 2")
        
        switch mockView.outputs[0] {
        case .setLoading(_):
            break
        default:
            XCTFail("First output must be setLoading")
        }
        switch mockView.outputs[1] {
        case .setPopularTrailerCellData(_):
            break
        default:
            XCTFail("Second output must be setPopularTrailerCellData")
        }
        switch mockView.outputs[2] {
        case .setLoading(_):
            break
        default:
            XCTFail("Third output must be setLoading")
        }
        XCTAssertTrue(mockView.loadingList[0])
        XCTAssertFalse(mockView.loadingList[1])
        
    }
}
private class MockPopularTrailerCellView: PopularTrailerCellViewModelDelegate{
    var loadingList = [Bool]()
    var outputs = [PopularTrailerCellOutput]()
    func notifyPopularTrailerCell(_ output: PopularTrailerCellOutput) {
        outputs.append(output)
        switch output {
        case .setLoading(let isLoading):
            loadingList.append(isLoading)
        default: break
        }
    }
}
