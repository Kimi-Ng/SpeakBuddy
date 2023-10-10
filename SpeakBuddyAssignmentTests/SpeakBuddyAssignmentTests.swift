import XCTest
import SwiftUI
@testable import SpeakBuddyAssignment

final class SBConstantsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //test each string value is valid to build a color
    func testColorStringValid() throws {
        for color in SBColors.allCases {
            XCTAssertNotNil(Color(color.rawValue))
        }
    }
    
    //test each string value is valid to build an image
    func testImageStringValid() throws {
        for image in SBImages.allCases {
            XCTAssertNotNil(Image(image.rawValue))
        }
    }

    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
