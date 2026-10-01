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
        
            newList = selectedFilter.apply(to: newList)
        
        //sort
        
            newList = selectedSort.apply(to: newList)
        
        
        return newList
    }
    var searchText = ""
    var selectedFilter: Filters = .none
    var selectedSort: SortedBy = .none
    var path = NavigationPath()
    var projectError: ProjectTrackerError? = nil
    var canMove: Bool{
        return selectedFilter == .none && selectedSort == .none
    }
    
    enum ProjectTrackerError: Error, LocalizedError, Identifiable, CustomStringConvertible{
        case loadError
        case saveError
        case editProjectError
        
        var description: String{
            switch self{
            case .loadError:
                return "Loading error"
            case .saveError:
                return "Save error"
            case .editProjectError:
                return "Editing Project error"
            }
        }

        
        
        var id: Self{self}
        var errorDescription: String?{
            switch self{
            case .loadError:
                return "Error loading data:\nDefault data added."
            case .saveError:
                return "Error saving data."
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
        saveData()
    }
    func deleteProject(at offSets: IndexSet){
       // projectStorage.deleteProject(at: offSets)
        let ids = getIdFromIndexSet(indexSet: offSets)
        projectStorage.deleteProjectsWithId(of: ids)
        saveData()
    }
    
    func moveProject(source: IndexSet, destination: Int){
       projectStorage.moveProject(from: source, to: destination)
        
        saveData()
    }
     
    func editProject(project: Project){
        if !projectStorage.editProject(project: project){
            projectError = ProjectTrackerError.editProjectError
            return
        }
        saveData()
    }
    func saveData(){
        projectError = projectStorage.saveData() ? nil : .saveError
        
    }
    func getIdFromIndexSet(indexSet: IndexSet)->Set<UUID>{
        // map indexSet of currentList -> set of Project.id
        var idSet: Set<UUID> = []
        for index in indexSet{
            idSet.insert(currentList[index].id) 
        }
        return idSet
    }
    }
