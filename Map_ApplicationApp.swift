//
//  Map_ApplicationApp.swift
//  Map Application
//
//  Created by Ismam Ferdous on 5/23/25.
//

import SwiftUI

@main
struct Map_ApplicationApp: App {
    
    
    @StateObject private var vm = LocationsViewModel()

    
    
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
