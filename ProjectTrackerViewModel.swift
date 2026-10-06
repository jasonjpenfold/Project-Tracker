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
        var selectedLanguages: Set<Language> = []
        var selectedStatuses: Set<Status> = []
        // filter favourites but put language enums in set
        for filterType in selectedFilters {
            if let language = filterType.language{
                selectedLanguages.insert(language)
            }else if let status = filterType.status{
                selectedStatuses.insert(status)
            }else{
                newList = filterType.apply(to: newList)}
            
        }
        //then filter selection of languages
        if !selectedLanguages.isEmpty{
            newList = Filters.keepLanguages(projects: newList, languages: selectedLanguages)
        }
        //then filter selection of statusTypes
        if !selectedStatuses.isEmpty{
            newList = Filters.keepStatuses(projects: newList, statuses: selectedStatuses)
        }
        //sort
        
            newList = selectedSort.apply(to: newList)
        
        
        return newList
    }
    var searchText = ""
    var selectedFilters: Set<Filters> = []
    var selectedSort: SortedBy = .none
    var path = NavigationPath()
    var projectError: ProjectTrackerError? = nil
    var canMove: Bool{
        return selectedFilters.isEmpty && selectedSort == .none
    }
    var favourites: Bool{
        selectedFilters.contains(.favourites)
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
    func toggleFavouritesFilter(){
        guard selectedFilters.contains(.favourites) else{
            selectedFilters.insert(.favourites)
            return
        }
        selectedFilters.remove(.favourites)
    }
    func toggleLanguageFilter(language: Language){
        guard selectedFilters.contains(.language(languageType: language)) else{
            selectedFilters.insert(.language(languageType: language))
            return
        }
        selectedFilters.remove(.language(languageType: language))
    }
    func toggleStatusFilter(status: Status){
        guard selectedFilters.contains(.status(statusType: status)) else{
            selectedFilters.insert(.status(statusType: status))
            return
        }
        selectedFilters.remove(.status(statusType: status))
    }
    func markAsWorkedOn(projectId: UUID)->Bool{
        let success =  projectStorage.markAsWorkedOn(projectId: projectId)
        guard success else { return false }
        saveData()
        return true
    }
    func markAsFavourite(projectId: UUID){
        let success = projectStorage.markAsFavourite(projectId: projectId)
        guard success else { return }
        saveData()
        return 
    }
    }
