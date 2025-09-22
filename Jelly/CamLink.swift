//
//  CamLink.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

import SwiftUI
import UIKit

struct CamLink: View {
    @State private var selectedImage: UIImage? // Holds the user's selected image
    @State private var diagnosisResult: String = "" // Stores Roboflow's disease classification
    @State private var isProcessing: Bool = false // Indicates if the app is processing
    @State private var isImagePickerPresented = false // Manages the image picker visibility
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary // Default source type
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(colors: [.teal, .white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    // Display the uploaded image or placeholder
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .padding()
                        
                    } else {
                        ZStack {
                            Rectangle() //Step 1 frame
                                .frame(width: 300, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                            VStack{
                                Image(systemName: "photo.badge.plus")
                                    .renderingMode(.original)
                                    .resizable()
                                // .foregroundColor(.green)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("No Image Selected")
                                // .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) //typical button frame
                                // .background(Color.white)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                            }
                        }

                    }
                    
                    // Image selection buttons
                    VStack {
                        HStack {
                            Button("Upload Image") {
                                imagePickerSourceType = .photoLibrary
                                isImagePickerPresented = true
                            }
                            .frame(width: 160, height: 40)
                            .background(Color.black)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            
                           /*
                            Button("Take Photo") {
                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                    imagePickerSourceType = .camera
                                    isImagePickerPresented = true
                                } else {
                                    diagnosisResult = "Camera not available on this device."
                                }
                            }
                            .frame(width: 160, height: 40)
                            .background(Color.black)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            */
                        }
                        // Analyze button
                        Button("DermaScan It") {
                            analyzeImage()
                        }
                        .frame(width: 200, height: 60)
                        .background(Color.ecogreen)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 10)
                        .disabled(selectedImage == nil || isProcessing) // Disable button if no image or processing
                        
                        // Progress indicator
                        if isProcessing {
                            ProgressView("Processing...")
                                .padding(.top, 15)
                        }
                        
                        // Display the diagnosis result
                        if !diagnosisResult.isEmpty {
                            Text("Diagnosis: \(diagnosisResult)")
                                .font(.headline)
                                .padding()
                        }
                        
                    }
                }
                    
                    

                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(sourceType: imagePickerSourceType, selectedImage: $selectedImage)
                }
            }
        }
        
        // Function to analyze the image
        private func analyzeImage() {
            guard let selectedImage = selectedImage,
                  let imageData = selectedImage.jpegData(compressionQuality: 0.8) else {
                diagnosisResult = "Please select or take a photo first!"
                return
            }
            
            isProcessing = true
            diagnosisResult = "Analyzing..."
            
            // Roboflow API Request
            let base64Image = imageData.base64EncodedString()
            let url = URL(string: "https://detect.roboflow.com/skin_detetection_real/2?api_key=JVKTzKH8ykJkwbZIrPeL&name=YOUR_IMAGE.jpg")!
            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = base64Image.data(using: .utf8)
            
            // Perform the API call
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    self.isProcessing = false
                    
                    if let error = error {
                        self.diagnosisResult = "Error: \(error.localizedDescription)"
                        return
                    }
                    
                    guard let data = data else {
                        self.diagnosisResult = "No data received from Roboflow"
                        return
                    }
                    
                    do {
                        // Parse the JSON response
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let predictions = jsonResponse["predictions"] as? [[String: Any]],
                           let topPrediction = predictions.first {
                            let topClass = topPrediction["class"] as? String ?? "Unknown"
                            let topConfidence = topPrediction["confidence"] as? Double ?? 0
                            self.diagnosisResult = "\(topClass) (\(topConfidence * 100)%)"
                        } else {
                            self.diagnosisResult = "Invalid response format from Roboflow"
                        }
                    } catch {
                        self.diagnosisResult = "Failed to parse response: \(error.localizedDescription)"
                    }
                }
            }.resume()
        }
    }
    
    // MARK: - ImagePicker Component
    extension CamLink {
        struct ImagePicker: UIViewControllerRepresentable {
            var sourceType: UIImagePickerController.SourceType
            @Binding var selectedImage: UIImage?
            
            class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
                @Binding var selectedImage: UIImage?
                
                init(selectedImage: Binding<UIImage?>) {
                    _selectedImage = selectedImage
                }
                
                func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                    if let image = info[.originalImage] as? UIImage {
                        selectedImage = image
                    }
                    picker.dismiss(animated: true)
                }
                
                func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                    picker.dismiss(animated: true)
                }
            }
            
            func makeCoordinator() -> Coordinator {
                Coordinator(selectedImage: $selectedImage)
            }
            
            func makeUIViewController(context: Context) -> UIImagePickerController {
                let picker = UIImagePickerController()
                picker.delegate = context.coordinator
                picker.sourceType = sourceType
                return picker
            }
            
            func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
        }
    }

