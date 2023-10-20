# Redirect 
* Controller의 request handler 메소드의 리턴이 void(또는 null)리턴이면  view의 이름으로 해석된다.
* String이면 view의 이름으로 해석되며, 'redirect:'라는 접두어가 붙으면, 응답코드가 302이고, location 응답 헤더의 값이 접두어 이후의 값으로 세팅

## RedirectAttributes
* Spring 프레임워크에서 리다이렉션 후, 데이터를 전달하는 데 사용되는 인터페이스
* 주로 POST 요청을 처리 후, 사용자를 다른 URL로 리다이렉션하면서 데이터를 유지하고 싶을 때 유용하다.
* 
### addAttribute() - 메서드
* 이 메서드를 사용하여 데이터를 파라미터 쿼리에 추가시킨다.

### addFlashAttribute() - 메서드
* 이 메서드를 사용하여 데이터를 Flash Attribute로 저장
* 리다이렉션 후 한번만 읽을 수 있음. (Session에 1회성으로 저장되어 페이지에 사용된 후 즉시 삭제됨.)


