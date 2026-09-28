import SwiftUI

@Observable
class ProjectTrackerViewModel{
    private(set) var projectStorage  = ProjectStorage(){
        didSet{
            projectStorage.saveData()
        }
    }
    
    var path = NavigationPath()
    
    init(){
        
        projectStorage.loadData()
        
    }
    
    func createEmptyProject()->Project{
        return Project.emptyProject()
    }
    
    func addProject(project: Project){
        projectStorage.addProject(project: project)
    }
}
