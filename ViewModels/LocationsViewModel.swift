import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location{
        
        didSet {
            self.updateMapRegion(location: mapLocation)
        }
    }
    
    
    //current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    
    
    //show location detail via sheet
    
    @Published var sheetLocation: Location? = nil
    
    
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    
     func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }

    
    func nextButtonPressed () {
        
        //get the current index
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            
            print("Couldn't find current index in locations array! Should never happen!!")
            
            return
            
            
            
        }
        
        //check if the currentIndex is valid
        
        let nextIndex = currentIndex + 1
        
        
        guard locations.indices.contains(nextIndex) else {
            
            // next index is NOT valid
            // restarting from 0.
            
           guard let firstLocation = locations.first else {
               return
           }
            showNextLocation(location: firstLocation)
            return
       
   
            
        }
        
        // next index IS valid
        
        let nextLocation = locations[nextIndex]
        
        showNextLocation(location: nextLocation)
        
        
            
            
        }
        
        
    }
    
 
        

        
    
    
    

