import SwiftUI

extension ContentView{
    
    
    var filters: some View {
        
        @Bindable var bindableModel = model
        return TabView{
            Tab("Languages", systemImage: "character.book.closed"){
                LanguagesFilterView()
            }
            Tab("Date", systemImage: "calendar"){
                
            }
        }.tabViewStyle(.automatic)
    }
}

