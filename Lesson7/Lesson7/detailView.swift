import SwiftUI

struct detailView: View {
    let event: Event
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
    
            Text(event.title)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Text(event.date.formatted(date: .long, time: .shortened))
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Text("Tür: \(event.type.rawValue)")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Text(event.hasReminder ? "Hatırlatıcı Var" : "Hatırlatıcı Yok")
                .font(.subheadline)
                .foregroundColor(event.hasReminder ? .green : .red)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Button{
                viewModel.deleteEvent(byIds: [event.id])
                dismiss()
            }label: {
                Text("SİL")
                
            }
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.red))
            )
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detay")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        detailView(
            event: Event(title: "Event 1", date: .now, type: .Toplantı, hasReminder: true),
            viewModel: EventViewModel()
        )
    }
}
