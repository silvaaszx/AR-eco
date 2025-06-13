import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        ZStack {
            
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
                
                
            
            VStack {
                Text("AR Ecosystem")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                
                Spacer()
                
                Button("Adicionar Árvore") {
                    // Action to add a tree
                    print("Botao pressionado!")
                    
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .padding()
            
            
        }
    }
}
