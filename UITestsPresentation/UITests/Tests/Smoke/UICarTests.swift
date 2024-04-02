final class UICarTests: BaseUITest {

    final override func setUp() {
        super.setUp()
        epic("Car store check")
        feature("Choose a car")
    }

    func testCarChoosing() {
        _ = h.getChooseCarHelper()
            .clickGoOn()
            .chooseCar()
            .checkAutoDescription()
    }
}
