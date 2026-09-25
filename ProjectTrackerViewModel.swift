import SwiftUI

@Observable
class ProjectTrackerViewModel{
    private(set) var projectStorage: ProjectStorage
    
    init(){
        self.projectStorage = ProjectStorage(projectDatabase: [Project(id: UUID(), name: "Project Tracker", language: .swift, description: "List of projects", status: .inProgress, dateStarted: .now, lastWorkedOn: .now, notes: "Tracking lists of projects, which language is used and status", favourite: true)])
    }
}
