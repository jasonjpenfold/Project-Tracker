import SwiftUI

@Observable
class ProjectTrackerViewModel{
    private(set) var projectStorage  = ProjectStorage()
    var path = NavigationPath()
    
    init(){
        
        projectStorage.loadData()
        
    }
    
    func createEmptyProject()->Project{
        return Project.emptyProject()
    }
    
    func addProject(project: Project){
        projectStorage.addProject(project: project)
        projectStorage.saveData()
    }
    func deleteProject(at offSets: IndexSet){
        projectStorage.deleteProject(at: offSets)
        projectStorage.saveData()
    }
    func moveProject(source: IndexSet, destination: Int){
        projectStorage.moveProject(from: source, to: destination)
        projectStorage.saveData()
    }
}
