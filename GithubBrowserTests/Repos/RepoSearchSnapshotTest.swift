import FBSnapshotTestCase
@testable import GithubBrowser

class RepoSearchSnapshotTest: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testRepoSearchSnapshot() {
        let coordinator = RepoCoordinator(navigationController: UINavigationController())
        coordinator.start()
        FBSnapshotVerifyView(coordinator.navigationController.visibleViewController!.view)
    }
}
