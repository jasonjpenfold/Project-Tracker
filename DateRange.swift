import SwiftUI

enum DateRange: Identifiable, CaseIterable, CustomStringConvertible{
    case today
    case week
    case month
    case year
    case all
    
    
    var id: Self{self}
    
    
    var description: String{
        switch self{
        case .today:
            return "Today"
        case .week:
            return "Last week"
        case .month:
            return "Last month"
        case .year:
            return "Last year"
        case .all:
            return "No filter"
        }
    }
    var convertToDate: Date?{
        let calendar = Calendar.current
        switch self {
        case .today:
            return calendar.date(byAdding: .day, value: -1, to: .now)
        case .week:
            return calendar.date(byAdding: .day, value: -7, to: .now)
        case .month:
            return calendar.date(byAdding: .month, value: -1, to: .now)
        case .year:
            return calendar.date(byAdding: .year, value: -1, to: .now)
        case .all:
            return nil
        }
    }
}
