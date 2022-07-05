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

    public byte[] pdfOperadoresTable(String text) throws IOException {

        //DOCUMENTO PDF
        int marginTop = 20; // Margen que yo quiera

        PDDocument document= new PDDocument(); //Creamos un documento
        PDPage page= new PDPage(PDRectangle.A4); //Creamos una pagina tipo A4
        document.addPage(page); //Añadimos una pagina al documento

        PDPageContentStream contentStream= new PDPageContentStream(document,page);

        PDRectangle mediaBox= page.getMediaBox();//Para obtener dimensiones de la pagina

        //Listamos clientes
        String[] operadores=text.split("\n");//Obtenemos las filas
        int cantColumnas= operadores[0].split("%").length;

        String[][] tablaOperadores= new String[operadores.length][cantColumnas];
        int x=0;

        for(String fila: operadores){
            String [] columnas= fila.split("%");
            int y=0;
            for(String columna: columnas){
                tablaOperadores[x][y]=columna;
                y++;
            }
            x++;
        }

        //Diseño de letra
        PDFont font=PDType1Font.TIMES_ROMAN;
        int fontsize=12;
        contentStream.setStrokingColor(Color.DARK_GRAY);
        contentStream.setLineWidth(1);

        //Diseño de tabla
        int cellWidth, cellHeight=30;//Dimensiones de las tablas
        int colCount= cantColumnas;//Numero de columnas
        int rowCount= operadores.length;//Numero de filas
        float init_x=marginTop,init_y=mediaBox.getHeight()-marginTop;

        String lineaDirec="";
        int cant_Saltos, minLogintudSalto=23;
        int cellWidthDireccion=150, cellWidthCorreo=170, cellWidthNum=30, cellWidthNombres=100;
        int cellHeightDinamic;
        //Creamos la tabla
        for(int i=0;i<rowCount;i++){
            cant_Saltos= hallarSaltos(tablaOperadores[i][4],font,fontsize,cellWidthDireccion);
            cellHeightDinamic=cellHeight*(cant_Saltos+1);

            for(int j=0;j<colCount;j++){
                cellWidth=70;
                if(j==4){
                    cellWidth= cellWidthDireccion;
                }if(j==2){
                    cellWidth= cellWidthCorreo;
                }if(j==0){
                    cellWidth= cellWidthNum;
                }if(j==1){
                    cellWidth= cellWidthNombres;
                }
                contentStream.addRect(init_x,init_y, cellWidth,-cellHeightDinamic);

                if(j==4){
                    String[] deletro=tablaOperadores[i][j].split("");
                    int salto=0;
                    for(int n=0;n<(cant_Saltos+1);n++){
                        //Formo línea
                        lineaDirec="";
                        int m=salto;
                        while(true){
                            if(m<deletro.length){
                                //Me aseguro de nunca pasar el tamaño de la lista
                                if(m>minLogintudSalto*(n+1)){
                                    //Caundo pasamos el minimo de salto, buscamos un espacio
                                    if(!deletro[m].equals(" ")){
                                        lineaDirec+=deletro[m];
                                    }else{
                                        //Volveremos a la posición despues del salto
                                        salto=m+1;
                                        break;
                                    }
                                }else{
                                    lineaDirec+=deletro[m];
                                }
                            }else{
                                break;
                            }
                            m++;
                        }
                        contentStream.beginText();
                        contentStream.setFont(font,fontsize);
                        contentStream.newLineAtOffset(init_x+10, init_y-(cellHeight*(n+1))+10);
                        contentStream.showText(lineaDirec);
                        contentStream.endText();
                    }
                }else{
                    contentStream.beginText();
                    contentStream.setFont(font,fontsize);
                    contentStream.newLineAtOffset(init_x+10, init_y-cellHeight+10);
                    contentStream.showText(tablaOperadores[i][j]);
                    contentStream.endText();
                }

                init_x+=cellWidth;
            }
            init_x=marginTop;//Volvemos al lado izquierdo del A4
            init_y-=cellHeightDinamic;//Bajamos de columna
        }
        contentStream.stroke();
        contentStream.close();

        ByteArrayOutputStream baos1= new ByteArrayOutputStream();
        document.save(baos1);
        document.close();
        return baos1.toByteArray();
    }

    private void centrar(PDFont font, int marginTop, int fontsize, String text, PDRectangle mediaBox, PDPageContentStream cs, Color color, int ajuste, boolean arriba) throws IOException {

        float x= getTextWidth(font, text, fontsize);
        float y= getTextHeight(font, fontsize);

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

    private int hallarSaltos(String text,PDFont font, int fontsize ,int cellWidth) throws IOException {
        float tamanoLetra=getTextWidth(font,text, fontsize);
        return ((int)tamanoLetra/cellWidth);
    }
    private float getTextWidth(PDFont font, String text, int fontsize) throws IOException {
        return (font.getStringWidth(text)/1000)*fontsize;
    }
    private float getTextHeight(PDFont font, int fontsize){
        return (font.getFontDescriptor().getFontBoundingBox().getHeight()/1000) *fontsize;
    }
}
