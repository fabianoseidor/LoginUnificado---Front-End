package br.com.multicloud.services;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;

import com.google.gson.Gson;

import br.com.multicloud.modal.Users;
import br.com.multicloud.modal.UsersDTO;
import br.com.multicloud.util.Util;

public class UserService {
	static int codigoSucesso = 200;
	
    public static UsersDTO buscaUserLoginDTO(String login, String pass, String webService) throws Exception {
        String urlParaChamada = webService + login ;

        try {
            // URL url = new URL(urlParaChamada);
            URL url =  URI.create( urlParaChamada ).toURL();
            HttpURLConnection conexao = (HttpURLConnection) url.openConnection();

            if (conexao.getResponseCode() != codigoSucesso)
                throw new RuntimeException("HTTP error code : " + conexao.getResponseCode());

            BufferedReader resposta = new BufferedReader(new InputStreamReader((conexao.getInputStream())));
            String jsonEmString = Util.converteJsonEmString(resposta);

            Gson gson = new Gson();
            UsersDTO users = gson.fromJson(jsonEmString, UsersDTO.class);

            return users;
        } catch (Exception e) {
            throw new Exception("ERRO: " + e);
        }
    }	
    
    public static Users buscaUserLogin(String login, String pass, String webService) throws Exception {
        String urlParaChamada = webService + login + "/" + pass;

        try {
            //URL url = new URL(urlParaChamada);
            URL url =  URI.create( urlParaChamada ).toURL();
            HttpURLConnection conexao = (HttpURLConnection) url.openConnection();

            if (conexao.getResponseCode() != codigoSucesso)
                throw new RuntimeException("HTTP error code API: " + conexao.getResponseCode());

            BufferedReader resposta = new BufferedReader(new InputStreamReader((conexao.getInputStream())));
            String jsonEmString = Util.converteJsonEmString(resposta);

            Gson gson = new Gson();
            Users users =  gson.fromJson(jsonEmString, Users.class);

            return users;
        } catch (Exception e) {
            throw new Exception("ERRO: " + e);
        }
    }	

    public static String updatePassoword(String login, String pass, Long idPessoa, String webService) throws Exception {
    	
    	
        String urlParaChamada = webService + "updadePass/" + login + "/" + pass + "/" + idPessoa;

        try {
            // URL url = new URL(urlParaChamada);
            URL url =  URI.create( urlParaChamada ).toURL();
            HttpURLConnection urlConnection = null;
            try {
                urlConnection = (HttpURLConnection) url.openConnection();

                urlConnection.setRequestMethod("POST");
                urlConnection.setReadTimeout(5000);
                urlConnection.setConnectTimeout(10000);
                urlConnection.setDoOutput(true);

                int responseCode = urlConnection.getResponseCode();

                if (responseCode == 200) {
                    InputStream in = new BufferedInputStream(urlConnection.getInputStream());
                    return readStream(in);
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                urlConnection.disconnect();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        return null;
    }	
    
    private static String readStream(InputStream in) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        StringBuilder sb = new StringBuilder();
        String line = null;
        while ((line = br.readLine()) != null) {
            sb.append(line + "\n");
        }
//        System.out.println(sb.toString());
        br.close();
        return sb.toString();
    }    
    

}
