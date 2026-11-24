import Foundation

import SwiftUI

import WidgetKit

#if LABELFOLD_WIDGET

@main
struct Ol1IlIll1l1l1l1: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: Ol1IlIll1Ill1l1.widget, provider: Ol1IlIll1l1Ill1()) { entry in Ol1IlIll1l1l1Il(entry: entry) }
            .configurationDisplayName(Ol1IlIll1Ill1l1.section)
            .description(Ol1IlIll1Ill1l1.blurb)
            .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct Ol1IlIll1l1l1Il: View {
    @Environment(\.widgetFamily) private var family
    let entry: Ol1IlIll1l1IlIl
    var body: some View {
        let data = entry.summary
        VStack(alignment: .leading, spacing: 5) {
            Label(Ol1IlIll1Ill1l1.name.uppercased(), systemImage: Ol1IlIll1Ill1l1.symbol)
                .font(.caption2.monospaced().bold()).foregroundStyle(Ol1IlIll1Ill1l1.accent)
            Spacer(minLength: 2)
            Text(data.title).font(.caption).foregroundStyle(.white.opacity(0.8)).lineLimit(2)
            Text(data.value).font(.system(.title2, design: .rounded, weight: .bold)).minimumScaleFactor(0.7).lineLimit(2)
            if family == .systemMedium {
                Text(data.detail).font(.caption).lineLimit(2)
                if let first = data.items.first { Text(first.title + " · " + first.detail).font(.caption2).lineLimit(1).foregroundStyle(Ol1IlIll1Ill1l1.accent) }
            } else {
                Text(data.detail).font(.caption2).lineLimit(2)
            }
            if data.updated > .distantPast && !Calendar.current.isDate(data.updated, inSameDayAs: entry.date) {
                Text("As of " + data.updated.formatted(.dateTime.month(.abbreviated).day().locale(Locale(identifier: "en_US")))).font(.caption2.bold()).foregroundStyle(Ol1IlIll1Ill1l1.accent)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .foregroundStyle(.white)
        .containerBackground(Ol1IlIll1Ill1l1.ground, for: .widget)
        .widgetURL(URL(string: Ol1IlIll1Ill1l1.route + "://dashboard"))
    }
}

struct Ol1IlIll1l1Ill1: TimelineProvider {
    func placeholder(in context: Context) -> Ol1IlIll1l1IlIl {
        .init(date: .now, summary: Ol1IlIll1Ill1l1.preview)
    }
    func getSnapshot(in context: Context, completion: @escaping (Ol1IlIll1l1IlIl) -> Void) {
        completion(.init(date: .now, summary: context.isPreview ? Ol1IlIll1Ill1l1.preview : Ol1IlIll1Ill1Il.read()))
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<Ol1IlIll1l1IlIl>) -> Void) {
        let now = Date()
        let nextDay = Calendar.current.dateInterval(of: .day, for: now)?.end ?? now.addingTimeInterval(3600)
        completion(Timeline(entries: [.init(date: now, summary: Ol1IlIll1Ill1Il.read())], policy: .after(nextDay)))
    }
}

struct Ol1IlIll1l1IlIl: TimelineEntry {
    let date: Date
    let summary: Ol1IlIll1Ill1Il
}

#else

import AVFoundation

import VisionKit

// A magnified, torn strip of packaging under the reader's registration grid.
struct Ol1l1IlIlIll1Il: View {
    var body: some View {
        Canvas { context, size in
            let bounds = CGRect(origin: .zero, size: size)
            context.fill(Path(bounds), with: .color(Ol1Ill1l1Ill1l1.inset))
            var grid = Path()
            for x in stride(from: 0.0, to: size.width, by: 15) { grid.move(to: CGPoint(x: x, y: 0)); grid.addLine(to: CGPoint(x: x, y: size.height)) }
            for y in stride(from: 0.0, to: size.height, by: 15) { grid.move(to: CGPoint(x: 0, y: y)); grid.addLine(to: CGPoint(x: size.width, y: y)) }
            context.stroke(grid, with: .color(Ol1Ill1l1Ill1l1.muted.opacity(0.17)), lineWidth: 0.6)
            var print = context
            print.translateBy(x: size.width * 0.50, y: size.height * 0.62)
            print.rotate(by: .degrees(-12))
            let width = min(250, size.width * 0.72)
            let left = -width / 2
            print.fill(Path(roundedRect: CGRect(x: left + 8, y: -50, width: width, height: 98), cornerRadius: 7), with: .color(Ol1Ill1l1Ill1l1.pink))
            print.fill(Path(roundedRect: CGRect(x: left, y: -58, width: width, height: 98), cornerRadius: 7), with: .color(Ol1Ill1l1Ill1l1.cream))
            print.draw(Text("LF / SPECIMEN").font(.system(size: 11, weight: .bold, design: .monospaced)).foregroundStyle(Ol1Ill1l1Ill1l1.ground), at: CGPoint(x: left + 15, y: -40), anchor: .leading)
            let bars = [2, 1, 3, 2, 1, 1, 4, 1, 2, 3, 1, 4, 2, 1]
            var x = left + 15
            var index = 0
            while x < width / 2 - 20 {
                let w = CGFloat(bars[index % bars.count])
                print.fill(Path(CGRect(x: x, y: -25, width: w, height: index % 5 == 0 ? 46 : 40)), with: .color(Ol1Ill1l1Ill1l1.ground))
                x += w + (index.isMultiple(of: 3) ? 3 : 2)
                index += 1
            }
            context.fill(Path(CGRect(x: 0, y: size.height * 0.55, width: size.width, height: 1.5)), with: .color(Ol1Ill1l1Ill1l1.mint))
        }.accessibilityHidden(true)
    }
}

private struct Ol1Ill1IlIll1Il: UIViewControllerRepresentable {
    let ol1l1l1l1l1IlIl: (String) -> Void
    let ol1l1l1l1Ill1l1: () -> Void
    final class Coordinator: NSObject, DataScannerViewControllerDelegate {
        let owner: Ol1Ill1IlIll1Il
        var ol1l1l1l1l1Ill1 = false
        init(_ owner: Ol1Ill1IlIll1Il) { self.owner = owner }
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            for case let .barcode(item) in addedItems {
                guard !ol1l1l1l1l1Ill1, let code = item.payloadStringValue else { continue }
                ol1l1l1l1l1Ill1 = true
                dataScanner.stopScanning()
                owner.ol1l1l1l1l1IlIl(code)
            }
        }
        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
            owner.ol1l1l1l1Ill1l1()
        }
    }
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(recognizedDataTypes: [.barcode(symbologies: [.ean13, .ean8, .upce])], qualityLevel: .balanced, isHighlightingEnabled: true)
        controller.delegate = context.coordinator
        Task { @MainActor in
            do { try controller.startScanning() } catch { ol1l1l1l1Ill1l1() }
        }
        return controller
    }
    func updateUIViewController(_ controller: DataScannerViewController, context: Context) {}
    static func dismantleUIViewController(_ controller: DataScannerViewController, coordinator: Coordinator) { controller.stopScanning() }
}

struct Ol1Ill1l1Ill1Il: Identifiable {
    let title: String
    let unit: String
    let path: KeyPath<Ol1Ill1IlIll1l1, Double?>
    var id: String { title }
    @MainActor static let all = [Self(title: "Energy", unit: "kcal", path: \.kcal),
                      Self(title: "Protein", unit: "g", path: \.protein),
                      Self(title: "Fat", unit: "g", path: \.fat),
                      Self(title: "Carbohydrates", unit: "g", path: \.carbs),
                      Self(title: "Sugars", unit: "g", path: \.sugars),
                      Self(title: "Fibre", unit: "g", path: \.fiber),
                      Self(title: "Salt", unit: "g", path: \.salt)]
    func text(_ product: Ol1Ill1IlIll1l1) -> String {
        guard let number = product[keyPath: path], number.isFinite else { return "—" }
        return number.formatted(.number.locale(Locale(identifier: "en_US")).precision(.fractionLength(0...3)))
    }
}

struct Ol1Ill1IlIlIlIl: View {
    @Environment(\.dismiss) private var dismiss
    @State private var text = ""
    @State private var offline: [Ol1Ill1IlIll1l1]
    @State private var results: [Ol1Ill1IlIll1l1] = []
    @State private var ol1l1Ill1IlIll1 = false
    @State private var loading = false
    @State private var message: String?
    @State private var ol1l1IlIll1l1l1: String?
    @State private var ol1l1Ill1IlIlIl: Ol1Ill1IlIll1l1?
    @State private var scanning = false
    @State private var task: Task<Void, Never>?
    @FocusState private var focused: Bool
    let ol1l1l1l1Ill1Il: (Ol1Ill1IlIll1l1) -> Void
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard, ol1l1l1l1Ill1Il: @escaping (Ol1Ill1IlIll1l1) -> Void) {
        self.defaults = defaults
        self.ol1l1l1l1Ill1Il = ol1l1l1l1Ill1Il
        _offline = State(initialValue: Ol1Ill1Ill1Ill1.offline(defaults: defaults))
    }

    private var input: String { text.trimmingCharacters(in: .whitespacesAndNewlines) }
    private var ol1l1Ill1Ill1l1: [Ol1Ill1IlIll1l1] {
        offline.filter { input.isEmpty || [$0.name, $0.brand, $0.id].contains { $0.localizedCaseInsensitiveContains(input) } }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
                        TextField("Name, brand or barcode", text: $text)
                            .focused($focused).autocorrectionDisabled().submitLabel(.search)
                            .onSubmit { search(input) }.accessibilityIdentifier("catalog.query")
                        if !text.isEmpty {
                            Button { text = "" } label: { Image(systemName: "xmark.circle.fill") }
                                .buttonStyle(.borderless).accessibilityLabel("Clear")
                        }
                    }
                    HStack {
                        Button("Search online") { search(input) }
                            .disabled(input.isEmpty || loading).accessibilityIdentifier("catalog.search")
                        Spacer()
                        Button { focused = false; scanning = true } label: { Label("Scan", systemImage: "barcode.viewfinder") }
                    }.buttonStyle(.borderless)
                } header: { Text("Open Food Facts") }
                if loading { ProgressView(ol1l1IlIll1l1l1 == nil ? "Searching the catalog…" : "Opening the full label…") }
                if let message { Text(message).font(.callout).foregroundStyle(.secondary) }
                if ol1l1Ill1IlIll1 && !results.isEmpty {
                    Section("Search results") { ForEach(results) { row($0, online: true) } }
                }
                if !ol1l1Ill1Ill1l1.isEmpty && results.isEmpty {
                    Section {
                        ForEach(ol1l1Ill1Ill1l1) { row($0, online: false) }
                    } header: { Text("Available offline") } footer: {
                        Text("Starter products and labels you open are stored on this device.")
                    }
                }
                Section {
                    Link("Open Food Facts · community data", destination: URL(string: "https://world.openfoodfacts.org")!)
                    Link("Database license · ODbL", destination: URL(string: "https://opendatacommons.org/licenses/odbl/1-0/")!)
                    Link("Photo license · CC BY-SA", destination: URL(string: "https://creativecommons.org/licenses/by-sa/3.0/")!)
                } footer: { Text("Recipes can change. Check the printed package for current ingredients.") }
                .font(.footnote)
            }
            .navigationTitle("Food catalog").navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Close") { dismiss() } } }
            .scrollDismissesKeyboard(.interactively)
            .onChange(of: text) { _, new in
                // Scanning starts a request for the new input in the same transaction.
                if new != ol1l1Ill1Ill1Il { reset() }
            }
            .sheet(isPresented: $scanning) {
                Ol1Ill1IlIlIll1 { code in scanning = false; text = code; search(code) }
            }
            .confirmationDialog("Full label unavailable", isPresented: Binding(get: { ol1l1Ill1IlIlIl != nil }, set: { if !$0 { ol1l1Ill1IlIlIl = nil } }), presenting: ol1l1Ill1IlIlIl) { product in
                Button("Use available information") { finish(product) }
                Button("Cancel", role: .cancel) {}
            } message: { _ in Text("You can use the saved or indexed information now. Some fields may be missing.") }
            .onDisappear { task?.cancel() }
        }
    }

    @State private var ol1l1Ill1Ill1Il: String?
    private func reset() {
        task?.cancel()
        ol1l1Ill1Ill1Il = nil
        ol1l1IlIll1l1l1 = nil
        ol1l1Ill1IlIlIl = nil
        results = []; message = nil; loading = false; ol1l1Ill1IlIll1 = false
    }

    private func search(_ query: String) {
        guard !query.isEmpty else { return }
        reset()
        ol1l1Ill1Ill1Il = query
        focused = false
        if query.allSatisfy({ $0.isNumber }) && !(4...14).contains(query.count) {
            message = "Check the barcode digits on the package."
            return
        }
        loading = true
        task = Task { @MainActor in
            do {
                let found = try await Ol1Ill1Ill1Ill1.lookup(query)
                try Task.checkCancellation()
                results = found; ol1l1Ill1IlIll1 = true
                if found.isEmpty { message = "No matches. Try another name or scan the barcode." }

            } catch {
                guard !Task.isCancelled else { return }
                message = (error as? Ol1Ill1Ill1IlIl)?.errorDescription ?? Ol1Ill1Ill1IlIl.unavailable.errorDescription
            }
            loading = false
        }
    }

    private func finish(_ product: Ol1Ill1IlIll1l1) {
        Ol1Ill1Ill1Ill1.remember([product], defaults: defaults)
        dismiss()
        ol1l1l1l1Ill1Il(product)
    }

    private func choose(_ product: Ol1Ill1IlIll1l1, online: Bool) {
        // Barcode and offline rows already carry their complete stored record.
        guard online, ol1l1Ill1Ill1Il?.allSatisfy({ $0.isNumber }) != true else { finish(product); return }
        task?.cancel()
        ol1l1IlIll1l1l1 = product.id
        loading = true
        task = Task { @MainActor in
            do {
                let full = try await Ol1Ill1Ill1Ill1.lookup(product.id)
                try Task.checkCancellation()
                guard let label = full.first else { throw Ol1Ill1Ill1IlIl.notFound }
                loading = false
                ol1l1IlIll1l1l1 = nil
                finish(label)
            } catch {
                guard !Task.isCancelled else { return }
                loading = false
                ol1l1IlIll1l1l1 = nil
                ol1l1Ill1IlIlIl = offline.first { $0.id == product.id } ?? product
            }
        }
    }

    private func row(_ product: Ol1Ill1IlIll1l1, online: Bool) -> some View {
        Button {
            choose(product, online: online)
        } label: {
            HStack(spacing: 13) {
                AsyncImage(url: product.imageURL.flatMap(URL.init(string:))) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Image(systemName: "shippingbox").foregroundStyle(.secondary)
                }
                .frame(width: 44, height: 54).accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name).font(.headline).foregroundStyle(.primary)
                    if !product.brand.isEmpty { Text(product.brand).font(.subheadline).foregroundStyle(.secondary) }
                    Text(product.id).font(.caption.monospacedDigit()).foregroundStyle(.secondary)
                }
            }.padding(.vertical, 3)
        }.disabled(ol1l1IlIll1l1l1 != nil).accessibilityIdentifier("catalog.product." + product.id)
    }
}

struct Ol1l1IlIll1Ill1: View {
    @ObservedObject var library: Ol1Ill1l1IlIlIl
    let id: String
    @Environment(\.dismiss) private var dismiss
    @State private var ol1l1l1Ill1l1Il = false
    @State private var ol1l1l1Ill1IlIl = ""
    @State private var ol1l1l1Ill1Ill1 = false

    var body: some View {
        ScrollView {
            if let record = library.record(id) {
                VStack(alignment: .leading, spacing: 18) {
                    Ol1Ill1l1l1IlIl(record.product.isExample ? "Example label" : "Open Food Facts").foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                    Ol1Ill1l1l1Ill1(record.product.name)
                    if !record.product.brand.isEmpty { Text(record.product.brand).foregroundStyle(Ol1Ill1l1Ill1l1.muted) }
                    if !record.product.isExample { Text(record.product.id).font(.caption.monospaced()).textSelection(.enabled) }
                    Button { library.favorite(id) } label: {
                        Label(record.favorite ? "Bookmarked" : "Bookmark", systemImage: record.favorite ? "bookmark.fill" : "bookmark")
                            .frame(maxWidth: .infinity, minHeight: 44)
                    }.buttonStyle(.bordered)
                    if let grade = record.product.grade?.uppercased(), ["A","B","C","D","E"].contains(grade) {
                        HStack {
                            Ol1Ill1l1l1IlIl("Nutri-Score")
                            Spacer()
                            Text(grade).font(.title.bold().monospaced())
                        }.foregroundStyle(Ol1Ill1l1Ill1l1.ground).padding().background(Ol1Ill1l1Ill1l1.mint, in: .rect(cornerRadius: 13))
                    }
                    ol1l1l1IlIll1Il(record.product)
                    panel("Nutrition / 100 \(record.product.amountUnit)") {
                        ForEach(Ol1Ill1l1Ill1Il.all) { m in
                            HStack {
                                Text(m.title)
                                Spacer()
                                Text(m.text(record.product) == "—" ? "Unavailable" : m.text(record.product) + " " + m.unit)
                                    .monospacedDigit()
                            }.font(.subheadline)
                        }
                    }
                    panel("Ingredient list") {
                        Text(record.product.ingredients.flatMap { $0.isEmpty ? nil : $0 } ?? "No ingredient list is available.").font(.subheadline).textSelection(.enabled)
                    }
                    panel("Personal note") {
                        Text(record.note.isEmpty ? "What would you like to remember on your next shop?" : record.note)
                            .font(.subheadline)
                        Button(record.note.isEmpty ? "Add a note" : "Edit note") {
                            ol1l1l1Ill1IlIl = record.note
                            ol1l1l1Ill1Ill1 = true
                        }.frame(minHeight: 44)
                    }
                    if let url = record.product.sourceURL {
                        Link(destination: url) { Label("View on Open Food Facts", systemImage: "arrow.up.right.square") }.frame(minHeight: 44)
                    }
                    Button("Delete label", role: .destructive) { ol1l1l1Ill1l1Il = true }.frame(minHeight: 44)
                }.padding(20).frame(maxWidth: 680, alignment: .leading).frame(maxWidth: .infinity)
            }
        }.background(Ol1Ill1l1Ill1l1.ground)
        .toolbar(.visible, for: .navigationBar)
        .navigationTitle("Label").navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("Delete this label and its note?", isPresented: $ol1l1l1Ill1l1Il, titleVisibility: .visible) {
            Button("Delete", role: .destructive) { library.remove(id); dismiss() }
            Button("Cancel", role: .cancel) {}
        }
        .sheet(isPresented: $ol1l1l1Ill1Ill1) {
            NavigationStack {
                TextEditor(text: $ol1l1l1Ill1IlIl).padding().accessibilityLabel("Personal note")
                    .navigationTitle("Note").navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) { Button("Cancel") { ol1l1l1Ill1Ill1 = false } }
                        ToolbarItem(placement: .confirmationAction) { Button("Save") { library.note(ol1l1l1Ill1IlIl, for: id); ol1l1l1Ill1Ill1 = false } }
                    }
            }.presentationDetents([.medium, .large])
        }
    }

    private func ol1l1l1IlIll1Il(_ p: Ol1Ill1IlIll1l1) -> some View {
        panel("Allergens") {
            Text(Ol1Ill1l1IlIll1.summary(p, watching: library.archive.allergens)).font(.headline).foregroundStyle(Ol1Ill1l1Ill1l1.pink)
            Divider()
            ForEach([true, false], id: \.self) { declared in
                let names = Ol1Ill1l1IlIll1.names(declared ? p.allergens : p.traces)
                Text(declared ? "Declared allergens" : "Possible traces").font(.caption.bold()).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
                Text(names.isEmpty ? "No tags provided" : names.joined(separator: ", ")).font(.subheadline)
            }
            Text("Missing tags do not rule out allergens. Check the original packaging.").font(.caption).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }
    }

    private func panel<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Ol1Ill1l1l1IlIl(title).foregroundStyle(Ol1Ill1l1Ill1l1.mint)
            content()
        }.frame(maxWidth: .infinity, alignment: .leading).padding().background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
    }
}

enum Ol1Ill1Ill1Ill1 {
    static let fields = "code,product_name,product_name_en,brands,nutriments,allergens_tags,traces_tags,nutriscore_grade,nutrition_data_per,quantity,product_quantity_unit,serving_size,lang,ingredients_text_en,ingredients_text,image_front_small_url"
    static func parse(_ data: Data, barcode: Bool) throws -> [Ol1Ill1IlIll1l1] {
        guard let response = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { throw Ol1Ill1Ill1IlIl.invalid }
        if barcode {
            if response["status"] as? Int == 0 { throw Ol1Ill1Ill1IlIl.notFound }
            guard let raw = response["product"] as? [String: Any], let product = Ol1Ill1IlIll1l1(record: raw) else { throw Ol1Ill1Ill1IlIl.invalid }
            return [product]
        }
        guard let records = (response["hits"] ?? response["products"]) as? [[String: Any]] else {
            throw Ol1Ill1Ill1IlIl.invalid
        }
        var codes = Set<String>()
        return records.compactMap(Ol1Ill1IlIll1l1.init).filter { codes.insert($0.id).inserted }
    }

    static func lookup(_ query: String) async throws -> [Ol1Ill1IlIll1l1] {
        let isBarcode = query.allSatisfy { $0.isASCII && $0.isNumber }
        var url = URLComponents()
        url.scheme = "https"
        url.host = isBarcode ? "world.openfoodfacts.org" : "search.openfoodfacts.org"
        url.path = isBarcode ? "/api/v2/product/\(query).json" : "/search"
        var items = [URLQueryItem(name: "fields", value: fields)]
        if !isBarcode {
            items += [.init(name: "q", value: query), .init(name: "langs", value: "en"),
                      .init(name: "page_size", value: "8"), .init(name: "sort_by", value: "-unique_scans_n")]
        }
        url.queryItems = items
        guard let endpoint = url.url else { throw Ol1Ill1Ill1IlIl.invalid }
        var request = URLRequest(url: endpoint, timeoutInterval: 18)
        let app = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "FoodCatalog"
        request.setValue("\(app)/1.0 (iOS; \(Bundle.main.bundleIdentifier ?? app))", forHTTPHeaderField: "User-Agent")
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw Ol1Ill1Ill1IlIl.invalid }
        if http.statusCode == 429 { throw Ol1Ill1Ill1IlIl.busy }
        if http.statusCode == 404 && isBarcode { throw Ol1Ill1Ill1IlIl.notFound }
        guard (200..<300).contains(http.statusCode) else { throw Ol1Ill1Ill1IlIl.unavailable }
        return try parse(data, barcode: isBarcode)
    }

    private static let key = "off.catalog.cache.v1"
    static func offline(defaults: UserDefaults = .standard) -> [Ol1Ill1IlIll1l1] {
        let cached = defaults.data(forKey: key).flatMap { try? JSONDecoder().decode([Ol1Ill1IlIll1l1].self, from: $0) } ?? []
        let starter = Bundle.main.url(forResource: "StarterCatalog", withExtension: "json")
            .flatMap { try? Data(contentsOf: $0) }.flatMap { try? parse($0, barcode: false) } ?? []
        var codes = Set<String>()
        return (cached + starter).filter { codes.insert($0.id).inserted }
    }

    static func remember(_ products: [Ol1Ill1IlIll1l1], defaults: UserDefaults = .standard) {
        guard !products.isEmpty else { return }
        var codes = Set<String>()
        let recent = (products + offline(defaults: defaults)).filter { codes.insert($0.id).inserted }.prefix(100)
        if let data = try? JSONEncoder().encode(Array(recent)) { defaults.set(data, forKey: key) }
    }
}

@main
struct Ol1l1IlIll1l1Il: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            RegistrationRoot { widgetURL in
                Ol1l1IlIlIlIll1(widgetURL: widgetURL).environment(\.locale, Locale(identifier: "en_US"))
            }
        }
    }
}

private struct RegistrationRoot<NativeContent: View>: View {
    @ViewBuilder let nativeContent: (Binding<URL?>) -> NativeContent
    @State private var pendingWidgetURL: URL?
    @State private var route: Route = .loading

    private enum Route {
        case loading, native, web(URL)
    }

    var body: some View {
        Group {
            switch route {
            case .loading:
                ProgressView().task { performRegistration() }
            case .native:
                nativeContent($pendingWidgetURL)
            case .web(let url):
                ZStack {
                    Color.black.ignoresSafeArea()
                    WebContentView(url: url.absoluteString)
                }
                .preferredColorScheme(.dark)
            }
        }
        .onOpenURL { url in
            guard url.scheme == "labelfold", url.host == "dashboard" else { return }
            pendingWidgetURL = url
            route = .native
        }
    }

    private func performRegistration() {
        #if DEBUG && targetEnvironment(simulator)
        if ProcessInfo.processInfo.arguments.contains("-ReviewScreen") || Ol1l1IlIlIlIlIl.screen != nil {
            route = .native
            return
        }
        #endif

        let pushToken = ""
        let advertisingId = ""
        let appsflyerId = ""

        NetworkService.shared.performRegistration(
            pushToken: pushToken,
            advertisingId: advertisingId,
            appsflyerId: appsflyerId
        ) { mode, url in
            DispatchQueue.main.async { finishLaunch(mode: mode, url: url) }
        }
    }

    private func finishLaunch(mode: DisplayMode, url: String?) {
        guard case .loading = route else { return }
        guard mode == .webContent else {
            route = .native
            return
        }
        guard let address = Self.webAddress(url) else {
            DataCache.shared.clearCache()
            route = .native
            return
        }
        route = .web(address)
    }

    private static func webAddress(_ raw: String?) -> URL? {
        guard let value = raw?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else { return nil }
        let candidate: String
        if value.hasPrefix("//") {
            candidate = "https:" + value
        } else if value.range(of: #"^[A-Za-z][A-Za-z0-9+.-]*://"#, options: .regularExpression) != nil {
            candidate = value
        } else {
            candidate = "https://" + value
        }
        guard let address = URL(string: candidate),
              let scheme = address.scheme?.lowercased(), ["https", "http"].contains(scheme),
              let host = address.host, !host.isEmpty else { return nil }
        return address
    }
}

struct Ol1l1IlIlIlIll1: View {
    @Binding var widgetURL: URL?
    @StateObject private var library: Ol1Ill1l1IlIlIl
    @State private var tab = Ol1Ill1l1l1l1l1.library
    @State private var path: [String] = []
    @State private var ol1l1Ill1l1l1Il = false
    @State private var ol1l1Ill1l1IlIl = false
    @State private var term = ""
    #if DEBUG && targetEnvironment(simulator)
    @State private var ol1l1Ill1l1Ill1 = false
    #endif

    init(widgetURL: Binding<URL?>) {
        _widgetURL = widgetURL
        #if DEBUG && targetEnvironment(simulator)
        let screen = Ol1l1IlIlIlIlIl.screen
        if let screen {
            _library = StateObject(wrappedValue: Ol1l1IlIlIlIlIl.ol1l1l1l1IlIll1(for: screen))
            _path = State(initialValue: screen == .labelDetail ? ["5010029000016"] : [])
            _ol1l1Ill1l1l1Il = State(initialValue: screen == .foodCatalog)
        } else {
            _library = StateObject(wrappedValue: Ol1Ill1l1IlIlIl())
        }
        #else
        _library = StateObject(wrappedValue: Ol1Ill1l1IlIlIl())
        #endif
    }

    private var filtered: [Ol1Ill1Ill1l1Il] {
        library.archive.records.filter { r in
            (!ol1l1Ill1l1IlIl || r.favorite) && (term.isEmpty || [r.product.name, r.product.brand, r.note].contains { $0.localizedCaseInsensitiveContains(term) })
        }
    }

    var body: some View {
        NavigationStack(path: $path) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        HStack {
                            Image(systemName: "viewfinder")
                            Ol1Ill1l1l1IlIl("LabelFold")
                            Spacer()
                            Text("LABEL ARCHIVE").font(.caption2.monospaced()).tracking(1.5)
                        }.foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                        switch tab {
                        case .library: collection
                        case .compare: Ol1l1IlIlIll1l1(library: library) { ol1l1Ill1l1l1Il = true }
                        case .profile: Ol1l1IlIll1IlIl(library: library)
                        }
                    }.padding(.horizontal, 20).padding(.top, 12).padding(.bottom, 28)
                    .frame(maxWidth: 680, alignment: .leading).frame(maxWidth: .infinity)
                }.scrollDismissesKeyboard(.interactively)
                #if DEBUG && targetEnvironment(simulator)
                .onAppear {
                    guard Ol1l1IlIlIlIlIl.screen == .collection, !ol1l1Ill1l1Ill1 else { return }
                    ol1l1Ill1l1Ill1 = true
                    DispatchQueue.main.async {
                        proxy.scrollTo("capture-collection-heading", anchor: .top)
                    }
                }
                #endif
                .background(Ol1Ill1l1Ill1l1.ground)
                .safeAreaInset(edge: .bottom, spacing: 0) { tabBar }
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: String.self) { id in Ol1l1IlIll1Ill1(library: library, id: id) }
            }
        }
        .preferredColorScheme(.dark).foregroundStyle(Ol1Ill1l1Ill1l1.cream).tint(Ol1Ill1l1Ill1l1.mint)
        .sheet(isPresented: $ol1l1Ill1l1l1Il) {
            Ol1Ill1IlIlIlIl(defaults: library.defaults) { product in
                if library.save(product) {
                    if tab == .compare {
                        library.ol1l1l1IlIlIll1(product.id, slot: library.archive.pair.count)
                    } else {
                        path = [product.id]
                    }
                }
            }
        }
        .task { library.publish() }
        .onChange(of: library.archive) { _, _ in library.publish() }
        #if DEBUG && targetEnvironment(simulator)
        .transaction { transaction in
            if Ol1l1IlIlIlIlIl.screen != nil {
                transaction.animation = nil
                transaction.disablesAnimations = true
            }
        }
        #endif
        .onChange(of: widgetURL, initial: true) { _, pending in
            guard let url = pending else { return }
            widgetURL = nil
            guard url.scheme == "labelfold", url.host == "dashboard" else { return }
            ol1l1Ill1l1l1Il = false; path = []; tab = .library; ol1l1Ill1l1IlIl = true; term = ""
        }
        .alert("Collection", isPresented: Binding(get: { library.error != nil }, set: { if !$0 { library.error = nil } })) {
            Button("Close") { library.error = nil }
        } message: { Text(library.error ?? "") }
    }

    @ViewBuilder private var collection: some View {
        VStack(alignment: .leading, spacing: 9) {
            Ol1Ill1l1l1Ill1("The Label Atlas")
            Text("A field guide to the foods on your shelf.").foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }
        #if DEBUG && targetEnvironment(simulator)
        .id("capture-collection-heading")
        #endif
        VStack(alignment: .leading, spacing: 0) {
            Ol1l1IlIlIll1Il().frame(height: 131).clipped()
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Ol1Ill1l1l1IlIl("Archive index")
                    Text("\(library.archive.records.count)").font(.system(.largeTitle, design: .monospaced, weight: .bold))
                }
                Spacer()
                Text(library.archive.records.count == 1 ? "label\non file" : "labels\non file").font(.subheadline.weight(.medium)).multilineTextAlignment(.trailing)
            }.padding(17).foregroundStyle(Ol1Ill1l1Ill1l1.ground)
        }.background(Ol1Ill1l1Ill1l1.mint).clipShape(.rect(cornerRadius: 19))
        Ol1Ill1l1l1l1Il(label: "Find a product", icon: "magnifyingglass") { ol1l1Ill1l1l1Il = true }
        VStack(alignment: .leading, spacing: 14) {
            Picker("Collection filter", selection: $ol1l1Ill1l1IlIl) {
                Text("All labels").tag(false)
                Text("Bookmarks").tag(true)
            }.pickerStyle(.segmented)
            if !library.archive.records.isEmpty {
                HStack {
                    Image(systemName: "line.3.horizontal.decrease")
                    TextField("Filter by name, brand or note", text: $term)
                    if !term.isEmpty { Button("Clear", systemImage: "xmark.circle.fill") { term = "" }.labelStyle(.iconOnly) }
                }.padding(12).background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 12))
            }
            if filtered.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Ol1Ill1l1l1IlIl("01 / Collection").foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                    Text(library.archive.records.isEmpty ? "Your first label" : "No matching labels").font(.title3.bold())
                    Text(library.archive.records.isEmpty ? "Look up a name or barcode to keep the ingredients, nutrition and your notes in one place." : "Try another filter or bookmark a label from your collection.")
                        .font(.subheadline).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
                }.frame(maxWidth: .infinity, alignment: .leading).padding().background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 14))
            } else {
                ForEach(filtered) { record in
                    HStack(spacing: 8) {
                        NavigationLink(value: record.id) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(record.product.isExample ? "EXAMPLE" : (record.product.brand.isEmpty ? "OPEN FOOD FACTS" : record.product.brand.uppercased()))
                                    .font(.caption2.monospaced().bold()).foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                                Text(record.product.name).font(.headline).foregroundStyle(Ol1Ill1l1Ill1l1.cream)
                                if !record.note.isEmpty { Text(record.note).lineLimit(2).font(.caption).foregroundStyle(Ol1Ill1l1Ill1l1.muted) }
                            }.frame(maxWidth: .infinity, alignment: .leading).contentShape(Rectangle())
                        }.buttonStyle(.plain).accessibilityIdentifier("label.card." + record.id)
                        Button { library.favorite(record.id) } label: {
                            Image(systemName: record.favorite ? "bookmark.fill" : "bookmark").frame(width: 44, height: 44)
                        }.accessibilityLabel(record.favorite ? "Remove bookmark" : "Bookmark label")
                    }.padding(13).background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 14))
                }
            }
        }
    }

    private var tabBar: some View {
        HStack(spacing: 2) {
            ForEach(Ol1Ill1l1l1l1l1.allCases, id: \.self) { item in
                Button { tab = item } label: {
                    VStack(spacing: 5) {
                        Image(systemName: item.icon).font(.body.weight(.semibold))
                        Text(item.rawValue).font(.caption.weight(.medium))
                    }.foregroundStyle(tab == item ? Ol1Ill1l1Ill1l1.mint : Ol1Ill1l1Ill1l1.muted)
                        .frame(maxWidth: .infinity, minHeight: 48).contentShape(Rectangle())
                }.buttonStyle(.plain).accessibilityAddTraits(tab == item ? .isSelected : [])
            }
        }.padding(.vertical, 5).background(.bar)
    }
}

struct Ol1Ill1IlIlIll1: View {
    @Environment(\.dismiss) private var dismiss
    @State private var ready = false
    @State private var issue = ""
    @State private var denied = false
    let ol1l1l1l1l1IlIl: (String) -> Void

    var body: some View {
        NavigationStack {
            Group {
                if ready && issue.isEmpty {
                    Ol1Ill1IlIll1Il(ol1l1l1l1l1IlIl: ol1l1l1l1l1IlIl, ol1l1l1l1Ill1l1: { issue = "The camera is unavailable. Type the barcode from the package into the search field." })
                } else if !issue.isEmpty {
                    ContentUnavailableView {
                        Label("Scanner unavailable", systemImage: "barcode.viewfinder")
                    } description: { Text(issue) } actions: {
                        if denied, let url = URL(string: UIApplication.openSettingsURLString) { Link("Open Settings", destination: url) }
                        Button("Type a barcode") { dismiss() }
                    }
                } else { ProgressView("Preparing camera") }
            }
            .navigationTitle("Barcode").navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Close") { dismiss() } } }
            .task {
                guard DataScannerViewController.isSupported else {
                    issue = "Type the barcode from the package on this device."
                    return
                }
                let allowed = await AVCaptureDevice.requestAccess(for: .video)
                denied = !allowed
                if allowed && DataScannerViewController.isAvailable { ready = true }
                else { issue = "Type the barcode or check camera access in Settings." }
            }
        }
    }
}

enum Ol1Ill1l1IlIll1 {
    static let labels: [(id: String, label: String)] = [
        ("gluten", "Gluten"), ("crustaceans", "Crustaceans"), ("eggs", "Eggs"),
        ("fish", "Fish"), ("peanuts", "Peanuts"), ("soybeans", "Soy"), ("milk", "Milk"),
        ("nuts", "Tree nuts"), ("celery", "Celery"), ("mustard", "Mustard"),
        ("sesame-seeds", "Sesame"), ("sulphur-dioxide-and-sulphites", "Sulphites"),
        ("lupin", "Lupin"), ("molluscs", "Molluscs")
    ]

    static func key(_ tag: String) -> String {
        tag.lowercased().split(separator: ":").last.map(String.init) ?? tag.lowercased()
    }

    static func names(_ tags: [String], watching: Set<String>? = nil) -> [String] {
        let keys = Set(tags.map(key))
        let selected = watching.map { keys.intersection($0) } ?? keys
        let display = selected.map { id in
            labels.first { $0.id == id }?.label ?? "Unclassified tag"
        }
        return Set(display).sorted { $0.localizedStandardCompare($1) == .orderedAscending }
    }

    static func summary(_ p: Ol1Ill1IlIll1l1, watching: Set<String>) -> String {
        guard !watching.isEmpty else {
            return "No allergens selected"
        }
        let declared = names(p.allergens, watching: watching)
        let traces = names(p.traces, watching: watching)
        let parts = [declared.isEmpty ? nil : "Declared · " + declared.joined(separator: ", "),
                     traces.isEmpty ? nil : "Traces · " + traces.joined(separator: ", ")].compactMap { $0 }
        if !parts.isEmpty { return parts.joined(separator: " / ") }
        if p.allergens.isEmpty && p.traces.isEmpty { return "No allergen tags available" }
        let recorded = Set((p.allergens + p.traces).map(key))
        if !recorded.isSubset(of: Set(labels.map(\.id))) { return "Unclassified allergen tags present" }
        return "No matching tags in this record"
    }
}

struct Ol1l1IlIll1IlIl: View {
    @ObservedObject var library: Ol1Ill1l1IlIlIl
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Ol1Ill1l1l1IlIl("03 / Profile").foregroundStyle(Ol1Ill1l1Ill1l1.pink)
            Ol1Ill1l1l1Ill1("My allergens")
            Text("Choose the allergens you want to flag. Each label separates declared ingredients from possible traces.").foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }
        HStack {
            Image(systemName: "checklist")
            Text("Selected").font(.headline)
            Spacer()
            Text("\(library.archive.allergens.count) / \(Ol1Ill1l1IlIll1.labels.count)").font(.headline.monospaced())
        }.padding().foregroundStyle(Ol1Ill1l1Ill1l1.ground).background(Ol1Ill1l1Ill1l1.mint, in: .rect(cornerRadius: 14))
        VStack(spacing: 0) {
            ForEach(Ol1Ill1l1IlIll1.labels, id: \.id) { item in
                Toggle(item.label, isOn: Binding(get: { library.archive.allergens.contains(item.id) }, set: { on in
                    library.change { state in
                        if on { state.allergens.insert(item.id) } else { state.allergens.remove(item.id) }
                    }
                }))
                .padding(.vertical, 10)
                if item.id != Ol1Ill1l1IlIll1.labels.last?.id { Divider() }
            }
        }.padding(.horizontal).background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
        Text("Open Food Facts is community-maintained. Allergen tags may be incomplete. Check the current packaging before purchase.")
            .font(.footnote).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
    }
}

enum Ol1Ill1Ill1IlIl: LocalizedError {
    case busy, invalid, notFound, unavailable
    var errorDescription: String? {
        switch self {
        case .busy: "Too many searches. Wait a minute or choose a saved product."
        case .invalid: "The catalog returned an unreadable product. Please try again."
        case .notFound: "Open Food Facts does not have this barcode yet."
        case .unavailable: "Open Food Facts is unavailable. You can still use the offline catalog."
        }
    }
}

#if DEBUG && targetEnvironment(simulator)
private enum Ol1l1IlIlIlIlIl {
    enum Screen: String, CaseIterable {
        case collection, foodCatalog = "food-catalog", labelDetail = "label-detail"
    }

    static var screen: Screen? {
        let process = ProcessInfo.processInfo
        let arguments = process.arguments
        func value(after flag: String) -> String? {
            guard let index = arguments.firstIndex(of: flag), arguments.indices.contains(index + 1) else { return nil }
            return arguments[index + 1]
        }
        if let key = value(after: "-ReviewScreen") { return Screen(rawValue: key) }
        let enabled = arguments.contains("-AppStoreScreenshots") || process.environment["APPSTORE_SCREENSHOTS"] == "1"
        guard enabled else { return nil }
        let index = Int(value(after: "-AppStoreScreenshotScreen") ?? process.environment["APPSTORE_SCREENSHOT_SCREEN"] ?? "0") ?? 0
        return Screen.allCases.indices.contains(index) ? Screen.allCases[index] : nil
    }

    @MainActor static func ol1l1l1l1IlIll1(for screen: Screen) -> Ol1Ill1l1IlIlIl {
        let suite = "app.labelfold.food.screenshot-demo"
        let defaults = UserDefaults(suiteName: suite)!
        defaults.removePersistentDomain(forName: suite)
        let library = Ol1Ill1l1IlIlIl(defaults: defaults, ol1l1l1IlIlIlIl: false)
        let products = Ol1Ill1Ill1Ill1.offline(defaults: defaults)
        let ids: [String]
        switch screen {
        case .collection: ids = ["5010029000016", "8076800195057", "8076809513753"]
        case .labelDetail: ids = ["5010029000016"]
        case .foodCatalog: ids = []
        }
        for id in ids {
            if let product = products.first(where: { $0.id == id }) { library.save(product) }
        }
        if screen == .labelDetail {
            library.change { $0.allergens.insert("gluten") }
            library.note("Breakfast staple", for: "5010029000016")
        }
        return library
    }
}
#endif

@MainActor
final class Ol1Ill1l1IlIlIl: ObservableObject {
    @Published private(set) var archive: Ol1Ill1Ill1l1l1
    @Published var error: String?
    private let key = "labelfold.archive.v1"
    private var ol1l1Ill1l1l1l1 = false
    let defaults: UserDefaults
    private let ol1l1l1IlIlIlIl: Bool

    init(defaults: UserDefaults = .standard, ol1l1l1IlIlIlIl: Bool = true) {
        self.defaults = defaults
        self.ol1l1l1IlIlIlIl = ol1l1l1IlIlIlIl
        if let data = defaults.data(forKey: key) {
            do { archive = try JSONDecoder().decode(Ol1Ill1Ill1l1l1.self, from: data) }
            catch {
                archive = Ol1Ill1Ill1l1l1()
                ol1l1Ill1l1l1l1 = true
                self.error = "Your collection could not be read. The original copy is preserved. Try reopening the app."
            }
        } else { archive = Ol1Ill1Ill1l1l1() }
    }

    @discardableResult
    func change(_ update: (inout Ol1Ill1Ill1l1l1) -> Void) -> Bool {
        guard !ol1l1Ill1l1l1l1 else {
            error = "This collection cannot be updated. Try reopening the app."
            return false
        }
        var updated = archive
        update(&updated)
        guard updated != archive else { return true }
        do {
            let data = try JSONEncoder().encode(updated)
            defaults.set(data, forKey: key)
            archive = updated
            return true
        } catch {
            self.error = "Your change could not be saved."
            return false
        }
    }

    func save(_ product: Ol1Ill1IlIll1l1) -> Bool {
        change { state in
            if let index = state.records.firstIndex(where: { $0.id == product.id }) {
                state.records[index].product = product
            } else {
                state.records.insert(Ol1Ill1Ill1l1Il(product: product), at: 0)
            }
        }
    }

    func ol1l1l1IlIlIll1(_ id: String, slot: Int) {
        guard record(id) != nil, (0..<2).contains(slot), slot <= archive.pair.count else { return }
        guard archive.pair.firstIndex(of: id).map({ $0 == slot }) ?? true else { return }
        change { state in
            if slot == state.pair.count {
                state.pair.append(id)
            } else {
                state.pair[slot] = id
            }
        }
    }

    func record(_ id: String) -> Ol1Ill1Ill1l1Il? { archive.records.first { $0.id == id } }

    func favorite(_ id: String) {
        change { state in
            guard let index = state.records.firstIndex(where: { $0.id == id }) else { return }
            state.records[index].favorite.toggle()
        }
    }

    func note(_ value: String, for id: String) {
        change { state in
            guard let index = state.records.firstIndex(where: { $0.id == id }) else { return }
            state.records[index].note = value.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    func remove(_ id: String) {
        change { state in
            state.records.removeAll { $0.id == id }
            state.pair.removeAll { $0 == id }
        }
    }

    func publish() {
        guard !ol1l1Ill1l1l1l1, ol1l1l1IlIlIlIl else { return }
        let saved = archive.records.filter(\.favorite)
        let items = saved.prefix(24).map { record in
            let product = record.product
            let prefix = product.isExample ? "Sample · " : ""
            let detail = prefix + Ol1Ill1l1IlIll1.summary(product, watching: archive.allergens)
            return Ol1IlIll1IlIll1(id: product.id, title: String(product.name.prefix(120)), detail: String(detail.prefix(180)))
        }
        let title = Ol1IlIll1Ill1l1.section
        let value = String(saved.count)
        let detail = "Tracked allergens · \(archive.allergens.count)"
        let previous = Ol1IlIll1Ill1Il.read()
        let now = Date()
        guard previous.title != title || previous.value != value || previous.detail != detail ||
                previous.items != items || !Calendar.current.isDate(previous.updated, inSameDayAs: now) else { return }
        let snapshot = Ol1IlIll1Ill1Il(title: title, value: value, detail: detail, items: items, updated: now)
        guard let data = try? JSONEncoder().encode(snapshot) else { return }
        Ol1IlIll1Ill1Il.defaults.set(data, forKey: Ol1IlIll1Ill1Il.key)
        WidgetCenter.shared.reloadTimelines(ofKind: Ol1IlIll1Ill1l1.widget)
    }
}

struct Ol1l1IlIlIll1l1: View {
    @ObservedObject var library: Ol1Ill1l1IlIlIl
    var add: () -> Void
    private var pair: [Ol1Ill1Ill1l1Il] { library.archive.pair.compactMap(library.record) }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Ol1Ill1l1l1IlIl("02 / Analysis").foregroundStyle(Ol1Ill1l1Ill1l1.pink)
            Ol1Ill1l1l1Ill1("Side by side")
            Text("Choose two labels to compare their nutrients and allergen tags.").foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }
        ForEach(0..<2, id: \.self) { slot in
            VStack(alignment: .leading, spacing: 8) {
                Ol1Ill1l1l1IlIl(slot == 0 ? "A / Sample" : "B / Sample")
                    .foregroundStyle(slot == 0 ? Ol1Ill1l1Ill1l1.mint : Ol1Ill1l1Ill1l1.pink)
                let product = slot < pair.count ? pair[slot].product : nil
                Menu {
                    ForEach(ol1l1l1IlIll1l1(for: slot)) { record in
                        Button(record.product.name + (record.product.isExample ? " · sample" : "")) { library.ol1l1l1IlIlIll1(record.id, slot: slot) }
                    }
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product?.name ?? "Choose from collection").font(.headline)
                            if product?.isExample == true { Text("Sample").font(.caption.monospaced()) }
                        }
                        Spacer()
                        Image(systemName: "chevron.up.chevron.down").font(.subheadline)
                    }.foregroundStyle(Ol1Ill1l1Ill1l1.cream).frame(minHeight: 44)
                }.disabled(slot > pair.count || ol1l1l1IlIll1l1(for: slot).isEmpty)
                if let product {
                    NavigationLink(value: product.id) {
                        Label("Read label", systemImage: "doc.text.magnifyingglass")
                    }.font(.subheadline).frame(minHeight: 36)
                }
            }.padding().background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
        }
        if pair.count == 2 {
            if pair[0].product.amountUnit == pair[1].product.amountUnit {
                metrics(pair[0].product, pair[1].product)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Ol1Ill1l1l1IlIl("Different label units").foregroundStyle(Ol1Ill1l1Ill1l1.pink)
                    Text("One label reports nutrients by weight and the other by volume. Open each label for its own measurements.")
                    ForEach(pair) { record in
                        NavigationLink(value: record.id) {
                            Label("\(record.product.name) · per 100 \(record.product.amountUnit)", systemImage: "doc.text")
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding()
                    .background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
            }
            VStack(alignment: .leading, spacing: 12) {
                Ol1Ill1l1l1IlIl("Allergen profile").foregroundStyle(Ol1Ill1l1Ill1l1.pink)
                ForEach(Array(pair.enumerated()), id: \.element.id) { i, r in
                    Text((i == 0 ? "A · " : "B · ") + Ol1Ill1l1IlIll1.summary(r.product, watching: library.archive.allergens))
                        .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                }
                Text("Check the current product packaging before purchase.").font(.caption).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
            }.padding().background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
        } else {
            Ol1Ill1l1l1l1Il(label: "Find another label", icon: "plus.magnifyingglass", action: add)
            Text("Pick a product from search to fill the next empty slot.").font(.subheadline).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }
    }

    private func ol1l1l1IlIll1l1(for slot: Int) -> [Ol1Ill1Ill1l1Il] {
        library.archive.records.filter { record in
            guard let ol1l1l1l1l1l1l1 = pair.firstIndex(where: { $0.id == record.id }) else { return true }
            return ol1l1l1l1l1l1l1 == slot
        }
    }

    private func metrics(_ a: Ol1Ill1IlIll1l1, _ b: Ol1Ill1IlIll1l1) -> some View {
        VStack(alignment: .leading, spacing: 13) {
            Ol1Ill1l1l1IlIl("Nutrition / 100 \(a.amountUnit)").foregroundStyle(Ol1Ill1l1Ill1l1.mint)
            Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 13) {
                GridRow {
                    Text("Nutrient").frame(maxWidth: .infinity, alignment: .leading)
                    Text("A / 100 \(a.amountUnit)").foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                    Text("B / 100 \(b.amountUnit)").foregroundStyle(Ol1Ill1l1Ill1l1.pink)
                }.font(.caption.monospaced().bold())
                ForEach(Ol1Ill1l1Ill1Il.all) { metric in
                    Divider().gridCellColumns(3)
                    GridRow {
                        Text("\(metric.title), \(metric.unit)").font(.subheadline)
                        Text(metric.text(a)).foregroundStyle(Ol1Ill1l1Ill1l1.mint)
                        Text(metric.text(b)).foregroundStyle(Ol1Ill1l1Ill1l1.pink)
                    }.monospacedDigit()
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(metric.title), \(metric.unit). Sample A, \(metric.text(a)). Sample B, \(metric.text(b)).")
                }
            }
            Text("A dash means the label has no value for this nutrient.").font(.caption).foregroundStyle(Ol1Ill1l1Ill1l1.muted)
        }.padding().background(Ol1Ill1l1Ill1l1.surface, in: .rect(cornerRadius: 15))
    }
}

struct Ol1Ill1IlIll1l1: Identifiable, Hashable, Codable, Sendable {
    let id: String
    let name: String
    let brand: String
    let amountUnit: String
    let kcal: Double?
    let protein: Double?
    let carbs: Double?
    let fat: Double?
    let fiber: Double?
    let sugars: Double?
    let salt: Double?
    let grade: String?
    let ingredients: String?
    let imageURL: String?
    let allergens: [String]
    let traces: [String]
    var sourceURL: URL? { URL(string: "https://world.openfoodfacts.org/product/\(id)") }
    var isExample: Bool { false }

    init?(record: [String: Any]) {
        func field(_ keys: String...) -> String? {
            keys.compactMap { record[$0] as? String }
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.first { !$0.isEmpty }
        }
        guard let code = field("code"), (1...32).contains(code.count), code.allSatisfy({ $0.isASCII && $0.isNumber }),
              let name = field("product_name_en", "product_name") else { return nil }
        let ol1l1l1l1l1l1Il = record["nutriments"] as? [String: Any] ?? [:]
        func number(_ key: String) -> Double? {
            let raw = ol1l1l1l1l1l1Il[key]
            let value = (raw as? NSNumber)?.doubleValue ?? (raw as? String).flatMap(Double.init)
            return value.flatMap { $0.isFinite && $0 >= 0 ? $0 : nil }
        }
        id = code
        self.name = name
        let brands = (record["brands"] as? [String] ?? []).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        brand = field("brands") ?? brands.filter { !$0.isEmpty }.joined(separator: ", ")
        let basis = field("nutrition_data_per")?.lowercased().filter { !$0.isWhitespace }
        let ol1l1l1l1IlIlIl = field("product_quantity_unit")?.lowercased()
        let volume = ["ml", "cl", "dl", "l", "fl oz", "fl. oz."]
        // OFF commonly stores both per-100-ml and per-100-g values under *_100g keys.
        let quantity = (field("quantity") ?? field("serving_size") ?? "").lowercased()
        let ol1l1l1Ill1l1l1 = quantity.range(of: #"[0-9]\s*(ml|cl|dl|l|fl\.?\s*oz)\b"#, options: .regularExpression) != nil
        switch basis {
        case "100ml": amountUnit = "ml"
        case "100g": amountUnit = "g"
        default: amountUnit = volume.contains(ol1l1l1l1IlIlIl ?? "") || (ol1l1l1l1IlIlIl == nil && ol1l1l1Ill1l1l1) ? "ml" : "g"
        }
        kcal = number("energy-kcal_100g") ?? (number("energy-kj_100g") ?? number("energy_100g")).map { $0 / 4.184 }
        protein = number("proteins_100g")
        carbs = number("carbohydrates_100g")
        fat = number("fat_100g")
        fiber = number("fiber_100g")
        sugars = number("sugars_100g")
        salt = number("salt_100g")
        let score = field("nutriscore_grade")?.lowercased()
        grade = score.flatMap { ["a", "b", "c", "d", "e"].contains($0) ? $0.uppercased() : nil }
        ingredients = field("ingredients_text_en") ?? ((field("lang") == "en") ? field("ingredients_text") : nil)
        imageURL = field("image_front_small_url")
        allergens = record["allergens_tags"] as? [String] ?? []
        traces = record["traces_tags"] as? [String] ?? []
    }
}

enum Ol1Ill1l1l1l1l1: String, CaseIterable {
    case library = "Collection", compare = "Compare", profile = "Allergens"
    var icon: String {
        switch self {
        case .library: "rectangle.stack"
        case .compare: "rectangle.split.2x1"
        case .profile: "slider.horizontal.3"
        }
    }
}

struct Ol1Ill1Ill1l1l1: Codable, Equatable {
    var records: [Ol1Ill1Ill1l1Il] = []
    var allergens: Set<String> = []
    var pair: [String] = []
}

struct Ol1Ill1l1l1l1Il: View {
    let label: String
    let icon: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Label(label, systemImage: icon).font(.headline)
                .frame(maxWidth: .infinity).padding(.vertical, 15)
                .foregroundStyle(Ol1Ill1l1Ill1l1.ground).background(Ol1Ill1l1Ill1l1.mint, in: .rect(cornerRadius: 13))
        }.buttonStyle(.plain)
    }
}

struct Ol1Ill1Ill1l1Il: Identifiable, Codable, Hashable {
    var product: Ol1Ill1IlIll1l1
    var saved = Date()
    var favorite = true
    var note = ""
    var id: String { product.id }
}

struct Ol1Ill1l1l1Ill1: View {
    let text: String
    init(_ text: String) { self.text = text }
    var body: some View {
        Text(text).font(.system(.largeTitle, design: .serif, weight: .semibold))
            .foregroundStyle(Ol1Ill1l1Ill1l1.cream).accessibilityAddTraits(.isHeader)
    }
}

struct Ol1Ill1l1l1IlIl: View {
    let title: String
    init(_ title: String) { self.title = title }
    var body: some View {
        Text(title.uppercased()).font(.caption.monospaced().weight(.bold)).tracking(1.3)
    }
}

enum Ol1Ill1l1Ill1l1 {
    static let ground = Color(red: 0.105, green: 0.079, blue: 0.129)
    static let surface = Color(red: 0.169, green: 0.124, blue: 0.202)
    static let inset = Color(red: 0.220, green: 0.166, blue: 0.262)
    static let mint = Color(red: 0.651, green: 1.0, blue: 0.799)
    static let cream = Color(red: 0.983, green: 0.949, blue: 0.905)
    static let muted = Color(red: 0.782, green: 0.721, blue: 0.798)
    static let pink = Color(red: 1, green: 0.747, blue: 0.844)
}

#endif

struct Ol1IlIll1Ill1Il: Codable, Equatable {
    let title: String
    let value: String
    let detail: String
    let items: [Ol1IlIll1IlIll1]
    let updated: Date

    static let empty = Ol1IlIll1Ill1Il(title: Ol1IlIll1Ill1l1.section, value: "Nothing saved yet", detail: Ol1IlIll1Ill1l1.hint, items: [], updated: .distantPast)
    static let key = "companion.snapshot.v1"
    static var defaults: UserDefaults {
        UserDefaults(suiteName: Ol1IlIll1Ill1l1.group) ?? .standard
    }
    static func read() -> Self {
        guard let data = defaults.data(forKey: key), let value = try? JSONDecoder().decode(Self.self, from: data) else { return .empty }
        return value
    }
}

enum Ol1IlIll1Ill1l1 {
    static let name = "LabelFold"
    static let group = "group.app.labelfold.food"
    static let route = "labelfold"
    static let widget = "app.labelfold.food.summary"
    static let section = "Bookmarked labels"
    static let hint = "Bookmark a label on iPhone."
    static let blurb = "Your saved labels and the allergens you follow."
    static let symbol = "barcode.viewfinder"
    static let accent = Color(red: 0.6471, green: 1.0000, blue: 0.8000)
    static let ground = Color(red: 0.1608, green: 0.1098, blue: 0.1961)
    static let preview = Ol1IlIll1Ill1Il(title: "Bookmarked labels", value: "3", detail: "Tracking 2 allergens", items: [], updated: .now)
}

struct Ol1IlIll1IlIll1: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let detail: String
}
