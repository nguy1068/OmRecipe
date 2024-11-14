import SwiftUI

func saveImage(image: UIImage, for recipe: Recipe) -> String? {
    let fileName = UUID().uuidString
    
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return nil
    }
    
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
        return nil
    }
    
    do {
        try imageData.write(to: fileURL)
        return fileName
    } catch {
        print("Error saving image: \(error)")
        return nil
    }
}

func loadImage(for recipe: Recipe) -> UIImage? {
    guard let fileName = recipe.thumbnailImagePath else {
        return nil
    }
    
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return nil
    }
    
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    do {
        let imageData = try Data(contentsOf: fileURL)
        return UIImage(data: imageData)
    } catch {
        print("Error loading image: \(error)")
        return nil
    }
}
