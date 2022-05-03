import SwiftUI
import PencilKit



struct DrawingView: View{
    @State var user:User
    @Environment(\.dismiss) var dismiss
    @State var isTapped = false
    @State private var canvasView = PKCanvasView()
    @State private var name = "Nameless Child \(Int.random(in: (0...1000)))"
    @Environment(\.undoManager) private var undoManager
    
    var body: some View {
       
        VStack{
                
                HStack(spacing: 15) {
                   
                    NavigationLink(destination: NewDrawingView(user: user, name: name).environmentObject(user),  isActive: Binding<Bool>(get: { isTapped },
                                                                                                                             set: { isTapped = $0; user.ArtWorks.append(ImageWrap(_image: Image(uiImage: canvasView.drawing.image(from: canvasView.bounds, scale: 1)), _name: name, _auth: user.UserName)) }), label: {
                        Text("Save")
                    })

                   
                    Button {
                        undoManager?.undo()
                    }label:{
                        Image(systemName: "arrowshape.turn.up.left")
                    }
                    Button {
                        undoManager?.redo()
                    }label:{
                        Image(systemName: "arrowshape.turn.up.right")
                    }
                    Button{
                        canvasView.drawing = PKDrawing()
                    }label: {
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                    NavigationLink(destination: ProfileView(user:user), label: {
                        Text("Cancel").foregroundColor(.red)
                    })
                }.padding().overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.white, lineWidth: 1)
                ).shadow(color:.gray, radius: 1)
            

            MyCanvas(canvasView: $canvasView).shadow(color: .accentColor, radius: 1).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
        }
    }
    struct MyCanvas: UIViewRepresentable {
        @Binding var canvasView: PKCanvasView
        let picker = PKToolPicker.init()

        
        
        func makeUIView(context: Context) -> PKCanvasView {
            self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
            self.canvasView.becomeFirstResponder()
            return canvasView
        }
        
        func updateUIView(_ uiView: PKCanvasView, context: Context) {
            picker.addObserver(canvasView)
            picker.setVisible(true, forFirstResponder: uiView)
            DispatchQueue.main.async {
                uiView.becomeFirstResponder()
            }
        }
        
    }
}
