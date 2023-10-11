import XCTest
@testable import SpeakBuddyAssignment

final class SBDataModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // test the conversion from raw data to view data model
    func testDataModelConvertion() throws {
        let mockAppUserModel = [
            AppUserModel(time: "現在", scores: 22),
            AppUserModel(time: "三ヶ月", scores: 33),
            AppUserModel(time: "1年", scores: 73),
            AppUserModel(time: "2年", scores: 100)]
        
        let fetcher = MockChartFetcher(userModel:mockAppUserModel)
        let viewModel = fetcher.chartData()
        for i in 0..<viewModel.count {
            XCTAssertEqual(viewModel[i].data.x, mockAppUserModel[i].time)
            XCTAssertEqual(viewModel[i].data.y, mockAppUserModel[i].scores)
        }
    }

}
