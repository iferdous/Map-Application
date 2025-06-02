import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    
    var body: some View {
        ZStack {
            // Background color
            
           // Color.green
                //.ignoresSafeArea()
                
            
            // Foreground content in horizontal layout
            HStack(alignment: .bottom, spacing: 0) {
                // Left: image and title
                VStack(alignment: .leading, spacing: 16.0) {
                    imageSection
                    titleSection
                }
                

                //Spacer()
                // use this above to make the buttons farther ^
                
                // Right: buttons
                VStack(spacing: 10) {
                    learnMoreButton
                    nextButton
                }
                
            }
            

        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
            
            )
        .cornerRadius(10)

        }
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        
    
    
        .environmentObject(LocationsViewModel())

    
}




// MARK: - Extension

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10.0)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10.0)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)

            Text(location.cityName)
                .font(.subheadline)
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var learnMoreButton: some View {
        Button {
            // Action
            
            vm.sheetLocation = location
            
            
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            
            // Action
            
            vm.nextButtonPressed()

            
            
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
