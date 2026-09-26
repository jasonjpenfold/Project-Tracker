import SwiftUI

enum Status: Identifiable,CaseIterable,CustomStringConvertible{
    
    case notStarted
    case inProgress
    case completed
    case forReview
    
    var id: Self{self}
    
    var description: String{
        switch self{
        case .notStarted:
            return "Not started - Come on let's do it"
        case .inProgress:
            return "In progress - You've got this"
        case .completed:
            return "Completed - YAY!"
        case .forReview:
            return "For review - make this better!"
        }
    }
    
}
