import SwiftUI

struct Project{
    var id: UUID
    var name: String
    var language: Language 
    var description: String
    var status: Status 
    var dateStarted: Date
    var lastWorkedOn: Date
    var notes: String
    var favourite: Bool
    
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
