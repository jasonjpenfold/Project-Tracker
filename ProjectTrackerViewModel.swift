import SwiftUI

@Observable
class ProjectTrackerViewModel{
    private(set) var projectStorage  = ProjectStorage()
    var currentList: [Project] {
        var newList = projectStorage.projectDatabase
        
        //search
        if !searchText.isEmpty{
            newList = newList.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
        //filter
        if let selectedFilter{
            newList = selectedFilter.apply(to: newList)
        }
        //sort
        if let selectedSort{
            newList = selectedSort.apply(to: newList)
        }
        
        return newList
    }
    var searchText = ""
    var selectedFilter: Filters? = nil
    var selectedSort: SortedBy? = nil
    var path = NavigationPath()
    var projectError: ProjectTrackerError? = nil
    
    enum ProjectTrackerError: Error, LocalizedError, Identifiable, CustomStringConvertible{
        var description: String{
            switch self{
            case .loadError:
                return "Loading error"
            case .editProjectError:
                return "Editing Project error"
            }
        }

        case loadError
        case editProjectError
        
        var id: Self{self}
        var errorDescription: String?{
            switch self{
            case .loadError:
                return "Error loading data:\nDefault data added."
            case .editProjectError:
                return "Unable to edit project."
            }
        }
            
    }
    
    init(){
        
        projectError = projectStorage.loadData() ? nil : .loadError
        
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
    func editProject(project: Project){
        if !projectStorage.editProject(project: project){
            projectError = ProjectTrackerError.editProjectError
        }
    }
}
