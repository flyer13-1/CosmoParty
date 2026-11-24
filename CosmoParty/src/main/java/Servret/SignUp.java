package Servret;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.player;
import Model.PlayerJb;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//登録画面
		String forwardPath = "WEB-INF/jsp/SignUp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
	}

	// 登録処理
    @Override
    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");


        // ================================
        // フォームからデータ取得
        // ================================

        String name = request.getParameter("playerName");

        String pass = request.getParameter("password");

        String confirmPass = request.getParameter("confirmPassword");

        String colorStr = request.getParameter("color");


        // ================================
        // 入力チェック
        // ================================

        if(name == null || name.trim().isEmpty()) {

            request.setAttribute("nameError",
                    "プレイヤー名を入力してください");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        if(pass == null || pass.isEmpty()) {

            request.setAttribute("passwordError",
                    "パスワードを入力してください");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        // パスワード一致確認
        if(confirmPass == null || !pass.equals(confirmPass)) {

            request.setAttribute("passwordMatchError",
                    "パスワードが一致しません");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        // カラー確認
        if(colorStr == null) {

            request.setAttribute("colorError",
                    "カラーを選択してください");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        int color;

        try {

            color = Integer.parseInt(colorStr);

        } catch(NumberFormatException e) {

            request.setAttribute("colorError",
                    "カラーの値が不正です");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        // カラー番号の範囲確認
        if(color < 1 || color > 10) {

            request.setAttribute("colorError",
                    "カラーの値が不正です");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

            return;

        }


        // ================================
        // PlayerJbに格納
        // ================================

        PlayerJb user = new PlayerJb();

        user.setName(name.trim());
        user.setPass(pass);
        user.setColor(color);


        // ================================
        // DB登録
        // ================================

        player dao = new player();

        try {

            boolean result = dao.insert(user);

            if(result) {

                // 登録成功
                response.sendRedirect(
                    request.getContextPath() + "/TitleCon"
                );

            } else {

                request.setAttribute("nameError",
                        "登録に失敗しました");

                request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                       .forward(request, response);

            }

        } catch(Exception e) {

            e.printStackTrace();

            request.setAttribute("nameError",
                    "登録に失敗しました。入力内容を確認してください。");

            request.getRequestDispatcher("/WEB-INF/jsp/SignUp.jsp")
                   .forward(request, response);

        }

    }

}
