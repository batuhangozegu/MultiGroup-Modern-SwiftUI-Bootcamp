// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MasterListViewModel()
    @State private var theme: Color = .blue.opacity(0.2)

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                NavigationLink {
                    ListAddView(viewModel: viewModel, theme: theme)
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Yeni Görev Ekle")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Başlık ve açıklama gir")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity)
                    .background(
                        // Kartın arka planı: temanın biraz daha koyu tonu
                        RoundedRectangle(cornerRadius: 14)
                            .fill(theme.opacity(0.55))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.black.opacity(0.08), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                }
                .buttonStyle(.plain)

                // Liste
                ListView(viewModel: viewModel, theme: theme)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .background(theme)
            .navigationTitle("Master List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.black)
        .onAppear { theme = viewModel.randomTheme() }
    }
}

#Preview { ContentView() }
