//
//  MainPageViewModelTests.swift
//  MovieDatabaseTests
//
//  Created by Hakan Silek on 22.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import XCTest
@testable import MovieDatabase
class MainPageViewModelTests: XCTestCase {

    private var viewModel: MainPageViewModel!
    private var mockView: MockMainPageViewController!
    override func setUp() {
        viewModel = MainPageViewModel()
        mockView = MockMainPageViewController()
        viewModel.delegate = mockView
    }
    
    func testLoadValid(){
        viewModel.load()
        XCTAssertTrue(mockView.outputs.count == 3)
        XCTAssertTrue(mockView.mainPageRows.count > 0)
        XCTAssertTrue(mockView.loadingList.count == 2)
        
        switch mockView.outputs[0] {
        case .setLoading(_):
            break
        default:
            XCTFail("First output should be setLoading")
        }
        switch mockView.outputs[1] {
        case .setList(_):
            break
        default:
            XCTFail("Second output should be setList")
        }
        switch mockView.outputs[2] {
        case .setLoading(_):
            break
        default:
            XCTFail("Third output should be setLoading")
        }
        
        XCTAssertTrue(mockView.loadingList[0])
        XCTAssertFalse(mockView.loadingList[1])
    }
}
private class MockMainPageViewController: MainPageViewModelDelegate{
    var loadingList = [Bool]()
    var mainPageRows = [CellConfigurator]()
    var outputs = [MainPageOutput]()
    func notifyViewController(_ output: MainPageOutput) {
        outputs.append(output)
        switch output {
        case .setLoading( let isLoading):
            loadingList.append(isLoading)
        case .setList(let list):
            mainPageRows = list
        }
    }
}
