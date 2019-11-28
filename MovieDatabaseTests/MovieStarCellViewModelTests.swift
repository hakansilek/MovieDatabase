//
//  MovieStarCellViewModelTests.swift
//  MovieDatabaseTests
//
//  Created by Hakan Silek on 25.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import XCTest
@testable import MovieDatabase
class MovieStarCellViewModelTests: XCTestCase {
    
    private var mockView: MockMovieStarCellView!
    private var viewModel: MovieStarCellViewModel!
    private var dataId = "moviestar1"
    override func setUp() {
        viewModel = MovieStarCellViewModel(dataId: dataId)
        mockView = MockMovieStarCellView()
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
        case .setMovieStarCellData(_):
            break
        default:
            XCTFail("Second output must be setCategoryCellData")
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
private class MockMovieStarCellView: MovieStarCellViewModelDelegate{
    
    var loadingList = [Bool]()
    var outputs = [MovieStarCellOutput]()
    func notifyMovieStarCell(_ output: MovieStarCellOutput) {
        outputs.append(output)
        switch output {
        case .setLoading(let isLoading):
            loadingList.append(isLoading)
        default: break
        }
    }
}
