import SwiftUI

struct Project: Identifiable{
    var id: UUID
    var name: String
    var language: Language 
    var description: String
    var status: Status 
    var dateStarted: Date
    var lastWorkedOn: Date
    var notes: String
    var favourite: Bool
    
    static func emptyProject()->Project{
        return Project(id: UUID(), name: "", language: .swift, description: "", status: .notStarted, dateStarted: .now, lastWorkedOn: .now, notes: "", favourite: false)
    }
    
}
/*
 ├── name
 ├── language
 ├── description
 ├── status
 ├── date started
 ├── last worked on
 ├── notes
 └── favourite
 */
