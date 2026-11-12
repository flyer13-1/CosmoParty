const colorOptions = document.querySelectorAll('.color-option');

let selectedColor = null;

colorOptions.forEach(color => {
    color.addEventListener('click', () => {

        colorOptions.forEach(c =>
            c.classList.remove('selected')
        );

        color.classList.add('selected');
        selectedColor = color.dataset.color;
    });
});

document.getElementById("registerBtn")
.addEventListener("click", async () => {

    const name =
    document.getElementById("playerName").value.trim();

    const password =
    document.getElementById("password").value;

    const confirmPassword =
    document.getElementById("confirmPassword").value;

    // エラー初期化
    document.getElementById("nameError").textContent = "";
    document.getElementById("passwordError").textContent = "";
    document.getElementById("passwordMatchError").textContent = "";
    document.getElementById("colorError").textContent = "";

    let valid = true;

    // プレイヤー名
    if(name === ""){
        document.getElementById("nameError")
        .textContent = "プレイヤー名を入力してください";
        valid = false;
    }

    // パスワード
    if(password === ""){
        document.getElementById("passwordError")
        .textContent = "パスワードを入力してください";
        valid = false;
    }

    // パスワード一致確認
    if(confirmPassword === ""){
        document.getElementById("passwordMatchError")
        .textContent = "再入力してください";
        valid = false;
    }
    else if(password !== confirmPassword){
        document.getElementById("passwordMatchError")
        .textContent = "パスワードが一致しません";
        valid = false;
    }

    // カラー未選択
    if(selectedColor === null){
        document.getElementById("colorError")
        .textContent = "カラーを選択してください";
        valid = false;
    }

    if(!valid){
        return;
    }

    const userData = {
        playerName: name,
        password: password,
        color: selectedColor
    };

    try{

        const response = await fetch(
            "http://localhost:3000/register",
            {
                method:"POST",
                headers:{
                    "Content-Type":"application/json"
                },
                body:JSON.stringify(userData)
            }
        );

        const result = await response.json();

        if(result.success){
            alert("登録成功");
        }else{
            alert("登録失敗");
        }

    }catch(error){
        console.error(error);
        alert("サーバー接続エラー");
    }

});