//
//  AddAcquaintance.swift
//  FaceToName
//
//  Created by tucker bichsel on 01/08/2023.
//

import SwiftUI

struct AddAcquaintance: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var name = ""
    @State private var description = ""
    var locationFetcher: LocationFetcher
    var onAdd: (Acquaintance) -> Void
    @Environment(\.dismiss) var dismiss
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedAcquaintances")
    
    var body: some View {
        VStack {
            
            NavigationView {
                Form {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    if image == nil {
                        Button("Add a Face to the Name") {
                            showingImagePicker = true
                        }
                    }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .toolbar {
                    ToolbarItem {
                        Button("Save") {
                            saveAcquaintance()
                        }
                        .disabled(inputImage == nil)
                    }
                }
                
                .onChange(of: inputImage) { _ in
                    convertImage()
                }
            }
            
            Button("Cancel") {
                dismiss()
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func convertImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func saveAcquaintance() {
        if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
            if let location = locationFetcher.lastKnownLocation {
                print("Your location is \(location)")
                let newAcquaintance = Acquaintance(id:UUID(), imageData: jpegData, name: name, description: description, location: Location(id: UUID(), latitude: location.latitude, longitude: location.longitude))
                onAdd(newAcquaintance)
            } else {
                print("Your location is unknown")
            }
        }
        dismiss()
    }
    
    func save() {
        
    }
}

//struct AddAcquaintance_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAcquaintance()
//    }
//}
