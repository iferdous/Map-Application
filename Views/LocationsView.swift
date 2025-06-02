import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel

    var body: some View {
        ZStack {
            // Fullscreen x with custom annotations
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
            .ignoresSafeArea()

            // Overlayed UI
            VStack(spacing: 0) {
                header
                    .padding()

                Spacer()

                // Current location preview
                LocationPreviewView(location: vm.mapLocation)
                    .shadow(color: Color.black.opacity(0.3), radius: 20)
                    .padding()
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    ))
            }
            
            
            
            .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                LocationDetailView(location: location)
                
            }
            
            
            
            
            
            
        }
    }

    // MARK: - Header View
    private var header: some View {
        VStack(spacing: 0) {
            Button(action: vm.toggleLocationsList) {
                HStack {
                    Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)

                    Spacer()

                    Image(systemName: "arrow.down")
                        .rotationEffect(.degrees(vm.showLocationsList ? 180 : 0))
                        .foregroundColor(.primary)
                        .padding(.trailing, 5)
                }
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
            }

            if vm.showLocationsList {
                LocationsListView()
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: vm.showLocationsList)
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
