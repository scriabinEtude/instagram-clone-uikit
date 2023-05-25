# Instagram Clone

<br/>

<img width="326" alt="intro" src="https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/ff6a6a0b-2da5-4e2a-8358-9022f771be2a">

<br/><br/>

### 사용 라이브러리

- UIKit
- Firebase
- FirebaseStorage
- SDWebImage
- YPImagePicker
- JGProgressHUD
- StoryBoard를 사용하지 않았습니다.

<br/><br/>

<details><summary><h1>Preview</h1></summary>

### 회원가입
  
<br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/e0840aa5-b9ef-45fc-b009-055f8fa663c7

<br/><br/>
  
### 패스워드 재설정 메일 보내기
  
<br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/e57d9c8f-bb6d-4b8f-a24b-d74642da116f

  <br/><br/>

### 게시물 작성
  
  <br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/184839cb-0e4f-4845-bde6-1048c30034c7

  <br/><br/>

### 피드 선택하여 팔로우하기
  
  <br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/eec1e6e5-4628-48c9-8732-59fce6bdd369

  <br/><br/>

### 유저 검색하여 팔로우하기
  
  <br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/38000c18-94e2-400f-878c-6b62cd57714b

  <br/><br/>

### 자신의 프로필은 팔로우 버튼 자리에 '프로필 수정' 버튼으로 대체

  <br/>
  
https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/e596c524-ef67-4c51-806c-61fb1bc4fd26

  <br/><br/>

### 알림
  
  <br/>

https://github.com/scriabinEtude/instagram-clone-uikit/assets/47556543/1bf2df7a-d801-443c-8fe7-de423192f21c
  
  <br/><br/>


</details>

<details><summary><h1>Features</h1></summary>

 <details><summary><h3>MVVM</h3></summary>

  ViewController - View 사이에 ViewModel을 추가합니다.\
  ViewModel안의 Model값이 업데이트 되면 View에 필요한 값들이 자동으로 업데이트 됩니다.\
  장점으로 다른 View가 Model에 따라 같은 UI값을 사용하고 싶을 때 유용합니다.\
  다른 View에서도 같은 ViewModel을 생성하여 사용하면 되기 때문입니다.
   
  <br/>
   
  ```swift
  // 화면 이동
  extension SearchController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileCellIdentifier, for: indexPath) as! ProfileCell
        cell.viewModel = PostViewModel(post: posts[indexPath.row])
        return cell
    }
  }
  ```
   
  <br/>
   
  ```swift
  // viewModel이 입력되면 didSet 으로 UI 세팅
  class ProfileCell: UICollectionViewCell {
    
    var viewModel: PostViewModel? {
        didSet { configure() }
  }
  ```
   
   <br/>
   
  ```swift
  // viewModel에 View에 필요한 값들이 들어있음
  struct PostViewModel {
    var post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }
    var username: String { return post.ownerUsername }
    var caption: String { return post.caption }
    var likes: Int { return post.likes }
    ...
  }
  ```
   
   <br/>

  </details>
  
  <details><summary><h3>Auto Layout</h3></summary>
    
  <br/>

  오토레이아웃 적용시 필요한 템플릿 코드를 줄이기 위해 xextension을 추가하였습니다.
    
  <br/>
    
  ```swift
  // 레이아웃 extension
  extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
    ...
  }
    
  ```
  
  <br/>
    
  ```swift
  // 사용
  class FeedCell: UICOllectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        ...
    }
  }
  ```

  </details>

</details>

