import SwiftUI

//raw data model from API
struct AppUserModel {
    let time: String
    let scores: Int
}

// bar char data model
struct BarDataModel {
    let x: String
    let y: Int
}

//view model for bar chart view
struct BarViewModel: Identifiable {
    let id = UUID()
    let data: BarDataModel
    var animated: Bool
}

protocol ChartDataProvider {
    func chartData() -> [BarViewModel]
}

class ChartViewModelFetcher {
    let provider: ChartDataProvider
    init(provider: ChartDataProvider) {
        self.provider = provider
    }

    func chartViewData() -> [BarViewModel] {
        provider.chartData()
    }
}

class ChartFetcher: ChartDataProvider {
    func chartData() -> [BarViewModel] {
        //TODO: some real implementation
        return []
    }
}

class MockChartFetcher: ChartDataProvider {
    static let mockAppUserModel = [
            AppUserModel(time: "現在", scores: 22),
            AppUserModel(time: "三ヶ月", scores: 33),
            AppUserModel(time: "1年", scores: 73),
            AppUserModel(time: "2年", scores: 100)]

    private let userModel:[AppUserModel]

    init(userModel: [AppUserModel] = mockAppUserModel) {
        self.userModel = userModel
    }

    func chartData() -> [BarViewModel] {
        let barModel = userModel.map { BarDataModel(x: $0.time, y: $0.scores)}
        return barModel.map { BarViewModel(data: $0, animated: false) }
    }
}


