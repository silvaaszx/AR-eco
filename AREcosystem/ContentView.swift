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


//ESTRUTURA DO TRADUTOR

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        print("J.A.R.V.I.S. DEBUG: A função makeUIView foi chamada. Criando ARView...") // LINHA 1 DE DEBUG

        let arView = ARView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        print("J.A.R.V.I.S. DEBUG: Sessão de AR iniciada. Retornando arView.") // LINHA 2 DE DEBUG

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Nada aqui por enquanto.
    }
}
