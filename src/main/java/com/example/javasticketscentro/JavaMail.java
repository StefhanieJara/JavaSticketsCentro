package com.example.javasticketscentro;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import java.io.File;
import java.util.ArrayList;
import java.util.Properties;

public class JavaMail {
    private final Properties properties = new Properties();

    public void sendMessage(String correo, String mensaje, String asunto, ArrayList<byte[]> listaQrs, ArrayList<String> detalles) throws MessagingException {

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

        if(listaQrs!=null){
            int i=0;
            MimeMultipart m= new MimeMultipart();
            for(byte[] bytes: listaQrs){
                //AÑADIR ARCHIVOS
                MimeBodyPart adjunto= new MimeBodyPart();
                DataSource bds= new ByteArrayDataSource(bytes,"application/octet-stream");
                adjunto.setDataHandler(new DataHandler(bds));
                adjunto.setFileName(detalles.get(i)+".png");
                m.addBodyPart(adjunto);
                //
                i++;
            }
            Message message= preparaMessage(session, myCuenta, correo, mensaje, asunto, m);
            Transport.send(message);
        }else{
            Message message= preparaMessage(session, myCuenta, correo, mensaje, asunto, null);
            Transport.send(message);
        }
    }

    private Message preparaMessage(Session session, String emisor, String receptor,String mensaje, String asunto, MimeMultipart m){
        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emisor)); //Mi correo

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(receptor)); //Receptor
            message.setSubject(asunto); //Asunto
            if(m!=null){
                BodyPart texto= new MimeBodyPart();
                texto.setContent(mensaje,"text/html"); //Añadir HTML
                m.addBodyPart(texto);
                message.setContent(m);
            }else{
                message.setText(mensaje); //Contenido
            }
            return message;
        }catch (MessagingException e) {
            System.out.println("Hubo un error al enviar el correo!");
            e.printStackTrace();
            return null;
        }
    }


}
