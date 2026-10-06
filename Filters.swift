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
        
        static var languages: [ProjectTrackerViewModel.Filters] {
            Language.allCases.map{.language(languageType:$0)}
        }

        
        case favourites
        case language(languageType: Language)
        case status(statusType: Status)
        case none
        
        
        var id: Self{self}
        
        var description: String{
            switch self{
            
            case .favourites:
                return "Favourites"
            case .language(let languageType):
                return languageType.description
            case .status(let statusType):
                return statusType.description
            case .none:
                return "No Filter"
            
            }
        }
        var language: Language?{
            if case .language(let lang) = self{
                return lang
            }
            return nil
        }
        var status: Status?{
            if case .status(let statusType) = self {
                return statusType
            }
            return nil
        }
        
        func apply(to projectList: [Project])->[Project]{
            switch self{
            case .favourites:
                return projectList.filter{$0.favourite == true}
            case .none:
                return projectList
           // case .language(languageType: let language):
                //return projectList.filter{$0.language == language}
            default:
                return projectList
            }
        }
        static func keepLanguages(projects:[Project], languages: Set<Language>)->[Project]{
            return projects.filter{project in
                for language in languages {
                    if project.language == language{
                        return true
                    }
                }  
                return false 
            }
        }
        static func keepStatuses(projects:[Project], statuses: Set<Status>)->[Project]{
            return projects.filter{project in
                for status in statuses {
                    if project.status == status{
                        return true
                    }
                }  
                return false 
            }
        }
        
    }
    
}
