import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [testCase(RedditSDKTests.allTests)]
}
#endif
