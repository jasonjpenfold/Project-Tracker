import SwiftUI

extension ProjectTrackerViewModel{
    enum SortedBy: Identifiable, CaseIterable, CustomStringConvertible{
        case none
        case nameAZ
        case nameZA
        case dateStarted
        case dateLast
                
        
        var id: Self{self}
        
        var description: String{
            switch self{
                
            case .none:
                return "Unsorted"
            case .nameAZ:
                return "A-Z"
            case .nameZA:
                return "Z-A"
            case .dateStarted:
                return "Date started"
            case .dateLast:
                return " Date last worked on"
                            
            }
        }
        
        func apply(to projectList: [Project])->[Project]{
            switch self{
            case .nameAZ:
                return projectList.sorted(by: {$0.name < $1.name})
            case .nameZA:
                return projectList.sorted(by: {$0.name > $1.name})
            case .dateStarted:
                return projectList.sorted(by:{ $0.dateStarted < $1.dateStarted})
            case .dateLast:
                return projectList.sorted(by:{ $0.lastWorkedOn < $1.lastWorkedOn})
            case .none:
                return projectList
            }
        }
    }
    
}
