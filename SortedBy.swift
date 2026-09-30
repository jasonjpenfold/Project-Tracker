import SwiftUI

extension ProjectTrackerViewModel{
    enum SortedBy: Identifiable, CaseIterable, CustomStringConvertible{
        
        case nameAZ
        case nameZA
        case dateStarted
        case none
        
        
        var id: Self{self}
        
        var description: String{
            switch self{
                
            case .nameAZ:
                return "A-Z"
            case .nameZA:
                return "Z-A"
            case .dateStarted:
                return "Date started"
            case .none:
                return "Not Sorted"
                
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
            case .none:
                return projectList
            }
        }
    }
    
}
