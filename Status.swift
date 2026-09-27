import SwiftUI

enum Status: Identifiable,CaseIterable,CustomStringConvertible{
    
    case planning
    case inProgress
    case completed
    case forReview
    case abandoned
    
    var id: Self{self}
    
    var description: String{
        switch self{
        case .planning:
            return "Plan phase - Come on let's do it"
        case .inProgress:
            return "In progress - You've got this"
        case .completed:
            return "Completed - YAY!"
        case .forReview:
            return "For review - make this better!"
        case.abandoned:
            return "Abandoned - but not forgotten"
        }
    }
    
}
