import Foundation

struct MyStatsHoldingsChartModel: Codable {
  let jjunhaa0211: StatsChartData
}

struct StatsChartData: Codable {
  let holdingsCount: Int
}
