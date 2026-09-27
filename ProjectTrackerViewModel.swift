import SwiftUI

@Observable
class ProjectTrackerViewModel{
    private(set) var projectStorage: ProjectStorage
    
    var path = NavigationPath()
    
    init(){
        self.projectStorage = ProjectStorage(projectDatabase: [Project(id: UUID(), name: "Project Tracker", language: .swift, description: "List of projects", status: .inProgress, dateStarted: .now, lastWorkedOn: .now, notes: "Tracking lists of projects, which language is used and status", favourite: true)])
    }
    
    func createEmptyProject()->Project{
        return Project.emptyProject()
    }
    
    func addProject(project: Project){
        projectStorage.addProject(project: project)
    }
}
