import XCTest
@testable import LabelFold

final class LabelFoldTests: XCTestCase {
    private func product(_ code: String = "12345678", allergens: [String] = [], traces: [String] = []) throws -> Ol1Ill1IlIll1l1 {
        try XCTUnwrap(Ol1Ill1IlIll1l1(record: [
            "code": code, "product_name": "Muesli", "allergens_tags": allergens, "traces_tags": traces,
            "nutriments": ["energy-kcal_100g": 370, "sugars_100g": 0]
        ]))
    }

    func testDeclaredAndTraceStayDistinct() throws {
        let p = try product(allergens: ["en:milk", "en:milk"], traces: ["en:nuts"])
        XCTAssertEqual(Ol1Ill1l1IlIll1.summary(p, watching: ["nuts", "milk", "lupin"]), "Declared · Milk / Traces · Tree nuts")
        XCTAssertEqual(Ol1Ill1l1IlIll1.summary(p, watching: []), "No allergens selected")
        XCTAssertEqual(Ol1Ill1l1IlIll1.summary(p, watching: ["fish"]), "No matching tags in this record")
        XCTAssertEqual(Ol1Ill1l1IlIll1.summary(try product(), watching: ["milk"]), "No allergen tags available")
        XCTAssertEqual(Ol1Ill1l1IlIll1.summary(try product(allergens: ["en:unknown"]), watching: ["milk"]), "Unclassified allergen tags present")
    }

    @MainActor
    func testComparisonSeparatesUnknownFromZero() throws {
        let p = try product()
        let fiber = try XCTUnwrap(Ol1Ill1l1Ill1Il.all.first { $0.path == \Ol1Ill1IlIll1l1.fiber })
        let ol1IlIlIlIll1IlIl = try XCTUnwrap(Ol1Ill1l1Ill1Il.all.first { $0.path == \Ol1Ill1IlIll1l1.sugars })
        XCTAssertEqual(fiber.text(p), "—")
        XCTAssertEqual(ol1IlIlIlIll1IlIl.text(p), "0")
    }

    @MainActor
    func testComparisonAndNotesSurviveRelaunchAndRemove() throws {
        let suite = "LabelFoldTests." + UUID().uuidString
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let library = Ol1Ill1l1IlIlIl(defaults: defaults)
        let a = try product(), b = try product("87654321")
        XCTAssertTrue(library.save(a))
        XCTAssertTrue(library.save(b))
        library.ol1l1l1IlIlIll1(a.id, slot: 0)
        library.ol1l1l1IlIlIll1(a.id, slot: 1)
        XCTAssertEqual(library.archive.pair, [a.id])
        library.ol1l1l1IlIlIll1(b.id, slot: 1)
        library.note("For the weekend", for: a.id)
        library.favorite(a.id)
        library.change { $0.allergens.insert("milk") }
        XCTAssertTrue(library.save(a))

        let ol1IlIlIlIlIlIlIl = Ol1Ill1l1IlIlIl(defaults: defaults)
        XCTAssertEqual(ol1IlIlIlIlIlIlIl.archive.records.count, 2)
        XCTAssertEqual(ol1IlIlIlIlIlIlIl.archive.pair, [a.id, b.id])
        XCTAssertEqual(ol1IlIlIlIlIlIlIl.archive.allergens, ["milk"])
        XCTAssertEqual(ol1IlIlIlIlIlIlIl.record(a.id)?.note, "For the weekend")
        XCTAssertEqual(ol1IlIlIlIlIlIlIl.record(a.id)?.favorite, false)
        ol1IlIlIlIlIlIlIl.remove(a.id)
        let afterRemoval = Ol1Ill1l1IlIlIl(defaults: defaults)
        XCTAssertNil(afterRemoval.record(a.id))
        XCTAssertEqual(afterRemoval.archive.pair, [b.id])
    }
}

final class CatalogParsingTests: XCTestCase {
    private func barcode(_ fields: [String: Any]) throws -> Ol1Ill1IlIll1l1 {
        var record: [String: Any] = ["code": "0123456789012", "product_name": "Oat drink"]
        record.merge(fields) { _, updated in updated }
        let data = try JSONSerialization.data(withJSONObject: ["status": 1, "product": record])
        return try XCTUnwrap(Ol1Ill1Ill1Ill1.parse(data, barcode: true).first)
    }

    func testMissingNutritionZeroAndKilojoules() throws {
        let drink = try barcode(["nutriments": ["energy-kj_100g": "418.4", "sugars_100g": 0, "salt_100g": -2]])
        XCTAssertEqual(try XCTUnwrap(drink.kcal), 100, accuracy: 0.0001)
        XCTAssertEqual(drink.sugars, 0)
        XCTAssertNil(drink.protein)
        XCTAssertNil(drink.salt)
        let ol1IlIlIlIlIll1l1 = try barcode(["nutriments": ["energy-kcal_100g": 0, "energy_100g": 418.4]])
        XCTAssertEqual(ol1IlIlIlIlIll1l1.kcal, 0)
        XCTAssertNil(try barcode([:]).kcal)
    }

    func testEnglishNamesAndIngredientsPreferEnglishLabels() throws {
        let ol1IlIlIlIlIlIll1 = try barcode(["lang": "fr", "product_name": "Boisson", "product_name_en": "Oat drink",
                                      "ingredients_text": "Eau, avoine", "ingredients_text_en": " Water, oats "])
        XCTAssertEqual(ol1IlIlIlIlIlIll1.name, "Oat drink")
        XCTAssertEqual(ol1IlIlIlIlIlIll1.ingredients, "Water, oats")

        let ol1IlIlIlIlIll1Il = try barcode(["lang": "fr", "product_name": "Boisson", "ingredients_text": "Eau, avoine"])
        XCTAssertEqual(ol1IlIlIlIlIll1Il.name, "Boisson")
        XCTAssertNil(ol1IlIlIlIlIll1Il.ingredients)
        XCTAssertEqual(try barcode(["lang": "en", "ingredients_text": "Water, oats"]).ingredients, "Water, oats")
    }

    func testExplicitNutritionBasisBeforePackageVolume() throws {
        XCTAssertEqual(try barcode(["nutrition_data_per": "100g", "product_quantity_unit": "ml"]).amountUnit, "g")
        XCTAssertEqual(try barcode(["nutrition_data_per": "100ml", "product_quantity_unit": "g"]).amountUnit, "ml")
        XCTAssertEqual(try barcode(["product_quantity_unit": "cl"]).amountUnit, "ml")
        XCTAssertEqual(try barcode(["quantity": "1.5 L"]).amountUnit, "ml")
        XCTAssertEqual(try barcode(["quantity": "500 g"]).amountUnit, "g")
    }

    func testSearchDeduplicatesByBarcodeAndPreservesLeadingZeroes() throws {
        let records = [
            ["code": "0123456789012", "product_name": "First label"],
            ["code": "not-a-code", "product_name": "Invalid"],
            ["code": "0123456789012", "product_name": "Duplicate"],
            ["code": "5012345678910", "product_name": "Another label"]
        ]
        let data = try JSONSerialization.data(withJSONObject: ["products": records])
        let products = try Ol1Ill1Ill1Ill1.parse(data, barcode: false)
        XCTAssertEqual(products.map(\.id), ["0123456789012", "5012345678910"])
        XCTAssertEqual(products.map(\.name), ["First label", "Another label"])
    }
}
