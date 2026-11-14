//
//  FeedbackCenter.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import SwiftUI


@Observable
final class FeedbackCenter {
    
    // Loading
    // Toast
    
    struct Toast: Identifiable, Equatable {
        
        enum Kind {case success, error, warning}
        
        let id = UUID()
        let kind: Kind
        let message: String
    }
    
    private(set) var isLoading: Bool = false
    private(set) var toast: Toast?
    
    // EasyLoading
    func showLoading() { isLoading = true}
    func dismissLoading() { isLoading = false}
    
    
    // SnakBarService [Toast]
    func showSuccessMessage(_ message: String) {show(.success, message)}
    func showErrorMessage(_ message: String) {show(.error, message)}
    func showWarningMessage(_ message: String) {show(.warning, message)}
    
    private func show(_ kind: Toast.Kind, _ message: String){
        
        let toast = Toast(kind: kind, message: message)
        withAnimation{self.toast = toast}
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            if self.toast?.id == toast.id {
                withAnimation{self.toast = nil}
            }
        }
        
    }
}


struct FeedbackOverlay: ViewModifier {
    
    @Environment(FeedbackCenter.self) private var feedback
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if let toast = feedback.toast {
                    ToastView(toast: toast)
                        .padding(.top, AppPadding.p8)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .overlay {
                if feedback.isLoading {
                    ZStack {
                        Color.black.opacity(0.35).ignoresSafeArea()
                        ProgressView()
                            .controlSize(.large)
                            .tint(ColorManager.white)
                            .padding(AppPadding.p20)
                            .background(.black.opacity(0.7), in:
                                            RoundedRectangle(cornerRadius: AppSize.s12))
                    }
                }
            }
    }
}


private struct ToastView: View {
    
    let toast: FeedbackCenter.Toast
    
    var body: some View {
        HStack(spacing: AppSize.s12){
            Image(icon)
                .resizable()
                .frame(width: AppSize.s24, height: AppSize.s24)
            Text(toast.message)
                .font(AppFont.medium(FontSize.s14))
                .foregroundStyle(ColorManager.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(AppPadding.p16)
        .background(color, in: RoundedRectangle(cornerRadius: AppSize.s12))
        .padding(.horizontal, AppPadding.p16)
        .shadow(radius: 4)
    }
    
    private var icon: ImageResource {
        switch toast.kind {
        case .success: icSuccess
        case .error: icError
        case .warning: icWarning
        }
    }
    
    private var color: Color {
        switch toast.kind {
        case .success: Color.green.opacity(0.9)
        case .error: ColorManager.error
        case .warning: Color.orange
        }
    }
}

extension View {
    
    func feedbackOverlay() -> some View {
        modifier(FeedbackOverlay())
    }
}
