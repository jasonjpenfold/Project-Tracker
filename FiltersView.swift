import SwiftUI

extension ContentView{
    
    
    var filters: some View {
        
        @Bindable var bindableModel = model
        return TabView{
            Tab("Languages", systemImage: "character.book.closed"){
                LanguagesFilterView()
            }
            Tab("Status", systemImage: "play.rectangle.fill"){
                StatusFilterView()
            }
            Tab("Date", systemImage: "calendar"){
                DateFilterView()
            }
        }.tabViewStyle(.automatic)
    }
}

