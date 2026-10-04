import SwiftUI

extension ContentView{
    
    
    var navigation: some View {
        
        @Bindable var bindableModel = model
        return NavigationStack(path: $bindableModel.path){
            VStack {
                Spacer()
                header
                Spacer()
                trackerBody
                Spacer()
                footer
                Spacer()
                
                
                
            }
            .navigationDestination(for: String.self){
                value in 
                if value == "AddView"{
                    let newProject = model.createEmptyProject()
                    AddView(newProject: newProject)
                }
            }
            // contentview owns navigationstack
            .navigationDestination(for: Project.self){
                project in 
                
                EditView(editProject: project)
                
                
            }
            .alert(item: $bindableModel.projectError){
                error in 
                Alert(title: Text(error.description), message: Text(error.localizedDescription), dismissButton: .default(Text("Ok")))
            }
            
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {model.toggleFavouritesFilter()}, label: { model.favourites ?
                        Image(systemName: "heart.fill") : Image(systemName: "heart")
                    })
                }
                /*
                 ToolbarItem{
                 Picker("Filter", selection: $model.selectedFilter){
                 ForEach(ProjectTrackerViewModel.Filters.allCases){
                 Text($0.description)
                 .tag($0)
                 }
                 }.pickerStyle(.inline)
                 }
                 */
                ToolbarItem{
                    Picker("Sorted By", selection: $bindableModel.selectedSort){
                        ForEach(ProjectTrackerViewModel.SortedBy.allCases){
                            Text($0.description)
                                .tag($0)
                        }
                    }.pickerStyle(.inline)
                }
                ToolbarItem{
                    Button{
                        model.path.append("AddView")
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Project Tracker Menu")
            .padding()
        
        
    }

    private var header: some View{
        VStack{
            
            Text("Project Tracker")
                .font(.title.monospaced().bold())
            
        }
    }
    
    private var trackerBody: some View{
        
        ProjectListView()
    }
    
    private var footer: some View{
        EditButton()
            .buttonStyle(.glass)
    }
}


