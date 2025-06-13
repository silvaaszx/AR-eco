import SwiftUI
import ARKit
import RealityKit

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
