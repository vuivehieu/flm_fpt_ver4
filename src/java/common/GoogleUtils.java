/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import model.AccountGoogle;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author phanh
 */
public class GoogleUtils {

    public static String getToken(final String code) throws IOException {
        String response = Request.Post(Constant.Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                        .add("client_id", Constant.Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constant.Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constant.Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", Constant.Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken  = jobj.get("access_token").toString().replaceAll("\"", "");
        return  accessToken;
                        
    }
    
    public static AccountGoogle getUserInfo(final String accessToken) throws IOException {
        String link = Constant.Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        
        AccountGoogle accountGoogle = new Gson().fromJson(response, AccountGoogle.class);
        System.out.println(accountGoogle);
        return accountGoogle;
    }
}
