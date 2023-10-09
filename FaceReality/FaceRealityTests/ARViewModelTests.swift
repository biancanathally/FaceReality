//
//  ARViewModelTest.swift
//  Face RealityTests
//
//  Created by mvitoriapereirac on 13/09/23.
//

import XCTest
import Firebase
import FirebaseCore

@testable import FaceReality
final class ARViewModelTest: XCTestCase {
    let arViewModel = ARViewModel()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSmileChecker() throws {
//        let arViewModel = ARViewModel()
        let isSmiling = arViewModel.isPersonSmiling(smileLeft: 0.4, smileRight: 0.4)
        let isGenuineSmiling = arViewModel.isPersonGenuineSmiling(smileLeft: 0.4, smileRight: 0.4, squintLeft: 0.2, squintRight: 0.2)
        let isNotGenuineSmiling = arViewModel.isPersonGenuineSmiling(smileLeft: 0.3, smileRight: 0.3, squintLeft: 0.2, squintRight: 0.2)
        let isNotSmiling = arViewModel.isPersonSmiling(smileLeft: 0.2, smileRight: 0.2)

        XCTAssertEqual(arViewModel.smileChecker(isSmiling: isSmiling, isGenuineSmiling: isGenuineSmiling), "Sorriso genuíno! 🤩")
        XCTAssertEqual(arViewModel.smileChecker(isSmiling: isSmiling, isGenuineSmiling: isNotGenuineSmiling), "Sorriso 😊")
        XCTAssertEqual(arViewModel.smileChecker(isSmiling: isNotSmiling, isGenuineSmiling: isNotGenuineSmiling), "Neutro 😐")

    }
    
    func testIsPersonSmiling() throws {
//        let arViewModel = ARViewModel()
        XCTAssertEqual(arViewModel.isPersonSmiling(smileLeft: 0.2, smileRight: 0.3), false)

    }
    
    func testIsPersonGenuineSmiling() throws {
        XCTAssertEqual(arViewModel.isPersonGenuineSmiling(smileLeft: 0.4, smileRight: 0.35, squintLeft: 0.2, squintRight: 0.2), true)
    }
    
    func testIsPersonScowling() throws {
        XCTAssertTrue(arViewModel.isPersonScowling(sneerLeft: 0.15, sneerRight: 0.20, squintLeft: 0.06, squintRight: 0.06, shrugLower: 0.4))
    }
    
    func testIsPersonsScared() throws {
        XCTAssertFalse(arViewModel.isPersonScared(wideLeft: 0.35, wideRight: 0.3))
    }
    
    func testIsPersonDisgusted() throws {
        XCTAssertFalse(arViewModel.isPersonDisgusted(sneerLeft: 0.5, sneerRight: 0.2))
        
    }
    
    func testisPersonFrowning() throws {
        XCTAssertTrue(arViewModel.isPersonFrowning(browInnerUp: 0.3, mouthRollUpper: 0.4, frownLeft: 0.3, frownRight: 0.3))
    }

    func testSadnessChecker() throws {
        XCTAssertEqual(arViewModel.sadnessChecker(isPersonFrowning: arViewModel.isPersonFrowning(browInnerUp: 0.3, mouthRollUpper: 0.4, frownLeft: 0.3, frownRight: 0.3)), "Triste... 😢")
        XCTAssertEqual(arViewModel.sadnessChecker(isPersonFrowning: arViewModel.isPersonFrowning(browInnerUp: 0.1, mouthRollUpper: 0.1, frownLeft: 0.1, frownRight: 0.1)), "Neutro 😐")

    }
    
    
}
