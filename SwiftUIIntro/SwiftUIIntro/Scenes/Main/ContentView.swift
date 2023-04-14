//
//  ContentView.swift
//  SwiftUIIntro
//
//  Created by Ильдар Аглиуллов on 13.04.2023.
//

import SwiftUI
import CoreData
import AGLUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    
    @State var selectedIndex = 0
    let colors: [Color] = [ .yellow, .blue, .green, .indigo, .brown ]
    let tabbarItems = [ "Random", "Travel", "Wallpaper", "Food", "Interior Design" ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                NavigationView {
                    switch selectedIndex {
                    case 0:
                        List {
                            ForEach(items) { item in
                                NavigationLink {
                                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                } label: {
                                    Text(item.timestamp!, formatter: itemFormatter)
                                }
                            }
                            .onDelete(perform: deleteItems)
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                EditButton()
                            }
                            ToolbarItem {
                                Button(action: addItem) {
                                    Label("Add Item", systemImage: "plus")
                                }
                            }
                        }
                        
                        Text("Select an item")
                    case 1:
                        TestView(text: tabbarItems[selectedIndex], color: colors[selectedIndex])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(selectedIndex)
                            .ignoresSafeArea()
                    case 2:
                        TestView(text: tabbarItems[selectedIndex], color: colors[selectedIndex])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(selectedIndex)
                            .ignoresSafeArea()
                    case 3:
                        TestView(text: tabbarItems[selectedIndex], color: colors[selectedIndex])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(selectedIndex)
                            .ignoresSafeArea()
                    case 4:
                        TestView(text: tabbarItems[selectedIndex], color: colors[selectedIndex])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(selectedIndex)
                            .ignoresSafeArea()
                    default:
                        TestView(text: "Error", color: .red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(selectedIndex)
                            .ignoresSafeArea()
                    }
                }
            }
            .ignoresSafeArea()
            
            CustomTabBarView(tabbarItems: tabbarItems, selectedIndex: $selectedIndex)
                .padding(.horizontal)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
