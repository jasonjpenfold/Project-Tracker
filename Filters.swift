import SwiftUI

extension ProjectTrackerViewModel{
    enum Filters: Identifiable, CaseIterable, CustomStringConvertible{
        
        case favourites
        
        
        var id: Self{self}
        
        var description: String{
            switch self{
            
            case .favourites:
                return "Favourites"
            
            }
        }
        
        func apply(to projectList: [Project])->[Project]{
            switch self{
            case .favourites:
                return projectList.filter{$0.favourite == true}
            }
        }
    }
    
}
