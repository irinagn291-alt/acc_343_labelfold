import XCTest

@MainActor
final class CatalogJourney: XCTestCase {
    func testProductFromCatalogToSavedRecord() {
        let app = XCUIApplication()
        app.launch()
        let find = app.buttons["Find a product"]
        XCTAssertTrue(find.waitForExistence(timeout: 10))
        find.tap()
        let product = app.buttons["catalog.product.5010029000016"]
        XCTAssertTrue(product.waitForExistence(timeout: 10))
        product.tap()
        
        let result = app.buttons["Bookmarked"]
        XCTAssertTrue(result.waitForExistence(timeout: 10))
        let screenshot = XCTAttachment(screenshot: app.screenshot())
        screenshot.name = "Saved product"
        screenshot.lifetime = .keepAlways
        add(screenshot)
        app.terminate()
        app.launch()
        XCTAssertTrue(app.buttons["label.card.5010029000016"].waitForExistence(timeout: 10))
    }
}
