import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // --- INÍCIO DA NOVA CORREÇÃO ---
        // Ativa a visualização de debug. Veremos pontos amarelos onde o ARKit entende o mundo.
        arView.debugOptions = .showFeaturePoints
        // --- FIM DA NOVA CORREÇÃO ---

        // O resto do código continua igual...
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        arView.session.run(configuration)
        
        let tapRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap))
        arView.addGestureRecognizer(tapRecognizer)
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Vazio por enquanto
    }
    
    // --- NOVO: O Coordenador para lidar com os eventos ---
    // Esta é a maneira correta no SwiftUI de lidar com eventos do UIKit, como gestos.
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }

            // 1. Pega a localização do toque na tela 2D
            let tapLocation = sender.location(in: arView)

            // 2. Dispara o "raio laser" (raycast) da tela 2D para o mundo 3D
            let results = arView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)

            // 3. Verifica se o raio atingiu alguma superfície
            if let firstResult = results.first {
                
                // 4. Cria uma âncora para prender nosso objeto ao mundo
                let anchor = AnchorEntity(world: firstResult.worldTransform)
                
                // 5. Cria o nosso objeto 3D (a Entidade)
                // Começaremos com um simples cubo cinza.
                let boxMesh = MeshResource.generateBox(size: 0.1) // Um cubo de 10cm
                let boxMaterial = SimpleMaterial(color: .gray, isMetallic: false)
                let boxEntity = ModelEntity(mesh: boxMesh, materials: [boxMaterial])
                
                // 6. "Cola" o cubo na âncora
                anchor.addChild(boxEntity)
                
                // 7. Adiciona o conjunto (âncora + cubo) à cena
                arView.scene.addAnchor(anchor)
            }
        }
    }
}
