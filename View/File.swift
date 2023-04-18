//import SwiftUI
//import UIKit
//
//struct JustifiedTextView: UIViewRepresentable {
//    @Binding var text: String
//
//    func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.isEditable = false
//        textView.isSelectable = false
//        textView.text = text
//        textView.font = UIFont.systemFont(ofSize: 17)
//        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//        textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
//        textView.textAlignment = .justified
//        return textView
//    }
//
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(text: $text)
//    }
//
//    class Coordinator: NSObject, UITextViewDelegate {
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//
//        func textViewDidChange(_ textView: UITextView) {
//            DispatchQueue.main.async {
//                self.text = textView.text
//            }
//        }
//    }
//}
