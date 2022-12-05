import UIKit

protocol LibraryToggleViewDelegate: AnyObject {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView)
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView)
}

class LibraryToggleView: UIView {
    enum State {
        case playlist
        case album
    }
    
    private var state: State = .playlist
    weak var delegate: LibraryToggleViewDelegate?
    
    private let playlistButton: UIButton = {
        // button UI
    }()
    
    private let albumsButton: UIButton = {
        // button UI
    }()
    
    private let indicatorView: UIView = {
        // indicator UI
    }()
    
    ...
    
    private func layoutIndicator() {
        UIView.animate(withDuration: 0.2) {
            switch self.state {
            case .playlist:
                self.indicatorView.frame = CGRect(x: 0, y: self.playlistButton.bottom, width: 100, height: 3)
            case .album:
                self.indicatorView.frame = CGRect(x: 100, y: self.playlistButton.bottom, width: 100, height: 3)
            }
        }
    }
    ...
    
    @objc private func didTapPlaylists() {
        state = .playlist
        delegate?.libraryToggleViewDidTapPlaylists(self)
        layoutIndicator()
    }
    
    @objc private func didTapAlbums() {
        state = .album
        delegate?.libraryToggleViewDidTapAlbums(self)
        layoutIndicator()
    }
    
    func update(for state: State) {
        self.state = state
        layoutIndicator()
    }
}
