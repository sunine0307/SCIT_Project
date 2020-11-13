package com.sesoc.web39.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class kakao_restapi {
   
   public JsonNode getAccessToken(String autorize_code) {
    
    final String RequestUrl = "https://kauth.kakao.com/oauth/token";

    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

    postParams.add(new BasicNameValuePair("client_id", "2e62014ff97c19cd48b281cffbf358a6"));

    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/oauth"));

    postParams.add(new BasicNameValuePair("code", autorize_code));

    final HttpClient client = HttpClientBuilder.create().build();

    final HttpPost post = new HttpPost(RequestUrl);

    JsonNode returnNode = null;

    try {

        post.setEntity(new UrlEncodedFormEntity(postParams));

        final HttpResponse response = client.execute(post);

        ObjectMapper mapper = new ObjectMapper();

        returnNode = mapper.readTree(response.getEntity().getContent());

    } catch (UnsupportedEncodingException e) {

        e.printStackTrace();

    } catch (ClientProtocolException e) {

        e.printStackTrace();

    } catch (IOException e) {

        e.printStackTrace();

    } finally {

    }

    return returnNode;

   }
   
   public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        post.addHeader("Authorization", "Bearer " + autorize_code);
 
        JsonNode returnNode = null;
 
        try {
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }
   
}
