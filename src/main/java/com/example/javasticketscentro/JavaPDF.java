package com.example.javasticketscentro;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class JavaPDF {
    public byte[] generaPDF(BufferedImage buffqr, String detalles, double subtotal, String codigoCompra, String nombre, String peli) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            baos = new ByteArrayOutputStream();
            ImageIO.write(buffqr, "png", baos);//Escribimos el buffer en el baos a byteArray[]
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                baos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //DOCUMENTO PDF
        int marginTop = 30; // Margen que yo quiera

        PDDocument document= new PDDocument(); //Creamos un documento
        PDPage page= new PDPage(PDRectangle.A4); //Creamos una pagina tipo A4
        document.addPage(page); //Añadimos una pagina al documento

        PDPageContentStream contentStream= new PDPageContentStream(document,page);


        PDRectangle mediaBox= page.getMediaBox();//Para Centrar la imagen y texto

        //Título
        PDFont font= PDType1Font.HELVETICA_BOLD;
        int fontsize=35;
        centrar(font, marginTop,fontsize,peli, mediaBox,contentStream, Color.BLACK, 0, true);

        //Aviso
        String text="Cada QR corresponde al grupo de butacas compradas.";
        font= PDType1Font.HELVETICA_OBLIQUE;
        fontsize=10;
        centrar(font, marginTop,fontsize,text, mediaBox,contentStream, new Color(220,0,0), 75, true);


        text="Muestra el código QR para ingresar a la función respectiva!";//Salto de línea
        font= PDType1Font.HELVETICA_OBLIQUE;
        centrar(font, marginTop,fontsize,text, mediaBox,contentStream, new Color(220,0,0), 90, true);

        //Código de compra
        text= "Código de Compra: ";
        font= PDType1Font.HELVETICA;
        fontsize=15;
        centrar(font, marginTop,fontsize,text, mediaBox, contentStream, Color.BLACK, 150, true);

        //Código de compra;
        font= PDType1Font.HELVETICA_BOLD;
        fontsize=17;
        centrar(font, marginTop,fontsize,codigoCompra, mediaBox,contentStream, Color.BLACK, 170, true);


        //Detalles del Cliente
        text="Cliente: "+nombre;
        font= PDType1Font.HELVETICA_BOLD;
        fontsize=12;
        centrar(font, marginTop,fontsize,text, mediaBox,contentStream, Color.BLACK, 200, false);

        String[] detalle=detalles.split("\n");
        //Detalles de compra
        font= PDType1Font.HELVETICA;
        fontsize=12;
        centrar(font, marginTop,fontsize,detalle[0], mediaBox,contentStream, Color.BLACK, 100, false);


        //Salto de línea
        font= PDType1Font.HELVETICA;
        fontsize=12;
        centrar(font, marginTop,fontsize,detalle[1], mediaBox,contentStream, Color.BLACK, 75, false);

        //Salto de Línea
        font= PDType1Font.HELVETICA_BOLD;
        fontsize=15;
        centrar(font, marginTop,fontsize,"Subtotal: S/"+subtotal, mediaBox,contentStream, Color.BLACK, 40, false);

        //Imagen QR
        PDImageXObject image=PDImageXObject.createFromByteArray(document,baos.toByteArray(),"QR");

        float x=(mediaBox.getWidth()-image.getWidth()/3)/2; //coordenada X
        float y=(mediaBox.getHeight()-image.getHeight()/3)/2;//coordenada Y

        contentStream.drawImage(image,x,y,image.getWidth()/3, image.getHeight()/3);
        contentStream.close();

        ByteArrayOutputStream baos1= new ByteArrayOutputStream();
        document.save(baos1);
        document.close();
        return baos1.toByteArray();
    }

    private void centrar(PDFont font, int marginTop, int fontsize, String text, PDRectangle mediaBox, PDPageContentStream cs, Color color, int ajuste, boolean arriba) throws IOException {

        float x= (font.getStringWidth(text)/1000)*fontsize;
        float y= (font.getFontDescriptor().getFontBoundingBox().getHeight()/1000) *fontsize;

        float center_x=(mediaBox.getWidth() - x)/2;
        float center_y;
        if(arriba){
            center_y=mediaBox.getHeight()-marginTop-y-ajuste;
        }else{
            center_y=marginTop+y+ajuste;
        }
        cs.beginText();
        cs.setFont(font,fontsize);
        cs.newLineAtOffset(center_x,center_y);//centramos
        cs.setNonStrokingColor(color);
        cs.showText(text);
        cs.endText();

    }
}
