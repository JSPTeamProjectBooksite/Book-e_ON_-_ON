/*
유저 더미데이터 입니다.

사용법은 JSON사용법을 검색하시면 사용하실수 있습니다.

[예시]
<script src="./js/userList.js"></script> //로 head 부분에 링크후
<script>

    document.write(userList[0].name); // 페이지에 "이현우"를 출력합니다.

    if(userList[0].id == "lhw1234");  // 아이디가 "lhw1234"가 맞는지 확인합니다.
    
</script>

이런식으로 사용할 수 있습니다.
*/
var userList = [
    {
        UID:0, //유저 고유번호(userID)
        name:"이현우", //닉네임이다.(편의를 위해 이렇게 작명)
        id:"lhw1234",
        password:"1q2w3e4r!!",
        gender:"man",
        email:"lhw1234@naver.com"
    },
    {
        UID:1,
        name:"최진영",
        id:"cjy1234",
        password:"1q2w3e4r!!",
        gender:"man",
        email:"cjy1234@gmail.com"
    },
    {
        UID:2,
        name:"김하영",
        id:"khy1234",
        password:"1q2w3e4r!!",
        gender:"woman",
        email:"khy1234@gmail.com"
    },
    {
        UID:3,
        name:"김지나",
        id:"kjn1234",
        password:"1q2w3e4r!!",
        gender:"woman",
        email:"kjn1234@gmail.com"
    },
    {
        UID:4,
        name:"안성환",
        id:"ash1234",
        password:"1q2w3e4r!!",
        gender:"man",
        email:"ash1234@gmail.com"
    }
];