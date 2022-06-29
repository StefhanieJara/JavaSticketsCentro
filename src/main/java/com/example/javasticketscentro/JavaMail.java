package com.example.javasticketscentro;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class JavaMail {
    private final Properties properties = new Properties();

    public void sendMessage(String correo, String mensaje, String asunto) throws MessagingException {

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port","587"); //funciona con 587
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        String myCuenta="javaSticket@gmail.com";
        String pass= "sbilvbrqnjqwkouk";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myCuenta, pass);
            }
        });
        Message message= preparaMessage(session, myCuenta, correo, mensaje, asunto);
        Transport.send(message);
    }

    private Message preparaMessage(Session session, String emisor, String receptor,String mensaje, String asunto){
        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emisor)); //Mi correo

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receptor)); //Receptor
            message.setSubject(asunto); //Asunto
            message.setText(mensaje); //Cotenido
            return message;
        }catch (MessagingException e) {
            System.out.println("Hubo un error al enviar el correo!");
            e.printStackTrace();
            return null;
        }

    }
}
