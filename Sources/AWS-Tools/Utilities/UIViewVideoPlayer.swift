import UIKit
import AVFoundation

public final class UIViewVideoPlayer: UIView {
    
    public var playerObserver: Any?
    public var loopVideo: Bool = true
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    /// Player has `automaticallyWaitsToMinimizeStalling` enabled - a loading stage to allow for buffer build up should be accounted for.
    public func playVideo(forResource: String, ofType: String) {
        guard let path = Bundle.main.path(forResource: forResource, ofType: ofType) else { return }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = layer as? AVPlayerLayer
        playerLayer?.videoGravity = .resizeAspectFill
        playerLayer?.player = player
        player.automaticallyWaitsToMinimizeStalling = true
        playerObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                                object: player.currentItem,
                                                                queue: .main) { _ in
            player.seek(to: CMTime.zero)
            player.play()
        }
        player.play()
    }
    
    deinit {
        guard let observer = playerObserver else { return }
        NotificationCenter.default.removeObserver(observer)
    }
}