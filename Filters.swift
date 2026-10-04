import SwiftUI

extension ProjectTrackerViewModel{
    enum Filters: Identifiable, CaseIterable, CustomStringConvertible, Hashable{
        static var allCases: [ProjectTrackerViewModel.Filters]{
            return [
                .none,
                .favourites] + [
                Language.allCases.map{.language(languageType:$0)}
            ].flatMap{$0}
        }

        
        case favourites
        case language(languageType: Language)
        case none
        
        
        var id: Self{self}
        
        var description: String{
            switch self{
            
            case .favourites:
                return "Favourites"
            case .language(let language):
                return language.description
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
            case .language(languageType: let language):
                return projectList.filter{$0.language == language}
            }
        }
    }
    
}
