//
//  LocationsListView.swift
//  Map Application
//
//  Created by Ismam Ferdous on 5/26/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)

                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
                
            }
        }
        //
        .listStyle(PlainListStyle())
        
        
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

// Extension for Row View


extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            // Display the first image if available
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
