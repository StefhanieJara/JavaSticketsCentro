package com.example.javasticketscentro;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.awt.*;
import java.awt.image.BufferedImage;


public class JavaQR {
    public BufferedImage downloadLocalQR(String codigoCompra, int idFuncion) throws WriterException{
        int size=1000;
        String codigo="Compra completada! Nro. Función: "+idFuncion+" | Código de Compra: "+codigoCompra;

        //Generar QR
        QRCodeWriter qrcode= new QRCodeWriter();
        BitMatrix matrix= qrcode.encode(codigo, BarcodeFormat.QR_CODE, size, size);

        int matrixWidth = matrix.getWidth();//Sacamos el tamaño de la matriz

        //Con un buffer imagen, creamos una imagen en rgb
        BufferedImage image= new BufferedImage(matrixWidth,matrixWidth,BufferedImage.TYPE_INT_RGB);
        image.createGraphics();//Creamos el gráfico

        Graphics2D gd= (Graphics2D) image.getGraphics();
        gd.setColor(Color.WHITE);//FONDO
        gd.fillRect(0,0,size,size);//ASIGNAMOS NUESTRO TAMAÑO
        gd.setColor(Color.BLACK);//QR

        //Hay que rellenar la matriz con dos for
        for(int b=0;b<matrixWidth;b++){
            for(int j=0;j<matrixWidth;j++){
                if(matrix.get(b,j)){
                    gd.fillRect(b,j,1,1);
                }
            }
        }
        return image;
    }
}
