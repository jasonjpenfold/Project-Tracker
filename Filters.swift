import SwiftUI

extension ProjectTrackerViewModel{
    enum Filters: Identifiable, CaseIterable, CustomStringConvertible{
        
        case favourites
        case none
        
        
        var id: Self{self}
        
        var description: String{
            switch self{
            
            case .favourites:
                return "Favourites"
            case .none:
                return "No Filter"
            
            }
        }
        
        func apply(to projectList: [Project])->[Project]{
            switch self{
            case .favourites:
                return projectList.filter{$0.favourite == true}
            case .none:
                return projectList
            }
        }
    }
    
}
