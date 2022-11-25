//
//  holdings.swift
//  Pods
//
//  Created by 박준하 on 2022/11/24.
//

import Foundation

struct MyStatsHoldingsChartModel: Codable {
  let jjunhaa0211: StatsChartData
}

struct StatsChartData: Codable {
  let holdingsCount: String
}
