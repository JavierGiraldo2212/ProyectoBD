package com.mycompany.sie_proyecto;


import Functions.UsersSesions;
import javax.swing.*;
// IMPORTS FOR EGRESADO
import Egresado.DatosEgresados;
import Egresado.LoginEgresado;
import Egresado.MainEgresados;
import Egresado.OfertasEgresados;

import java.awt.*;

public class SIE_PROYECTO {
    public static void main(String[] args) {
        // Create the frame
        
        UsersSesions userF = new UsersSesions();
        JFrame frame = new JFrame("Sistema de Información de Egresados");
        frame.setSize(1280,720);
        
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(1280, 720);
        frame.setLayout(new CardLayout());

        // Create a panel for the card layout
        JPanel cardPanel = new JPanel(new CardLayout());

        // Create the main panel with buttons
        MainPanel mainPanel = new MainPanel(cardPanel);

        // Add all panels to card panel
        cardPanel.add(mainPanel, "mainPanel");

        // Create the login panel for "Egresados" and its mainPanel
        LoginEgresado loginEgresado = new LoginEgresado(cardPanel,userF);
        MainEgresados mainEgresados = new MainEgresados(cardPanel, userF);
        DatosEgresados datosEgresados = new DatosEgresados(cardPanel, userF);
        OfertasEgresados ofertasEgresados = new OfertasEgresados(cardPanel, userF);

        cardPanel.add(loginEgresado, "loginEgresado");
        cardPanel.add(mainEgresados, "mainEgresado");
        cardPanel.add(datosEgresados, "egresadosDatos");
        cardPanel.add(ofertasEgresados, "egresadosOferta");
        
        // Create the login panel for "Empresa" and its mainPanel
        LoginEmpresa loginEmpresa = new LoginEmpresa(cardPanel, userF);
        MainEmpresa mainEmpresa = new MainEmpresa(cardPanel, userF);
        UseEmpresa useEmpresa = new UseEmpresa(cardPanel, userF);
        EmpresaOferta empresaOferta = new EmpresaOferta(cardPanel, userF);

        // Create the login panel for "Directivo" and its mainPanel
        LoginDirectivo loginDirectivo = new LoginDirectivo(cardPanel, userF);
        mainDirectivo maindirectivo = new mainDirectivo(cardPanel, userF);
        

        cardPanel.add(loginEmpresa, "loginEmpresa");
        cardPanel.add(mainEmpresa, "mainEmpresa");
        cardPanel.add(useEmpresa, "datosEmpresa");
        cardPanel.add(empresaOferta, "ofertaLaboral");

        cardPanel.add(loginDirectivo, "loginDirectivo");
        cardPanel.add(maindirectivo,"mainDirectivo");
        
        // Add card panel to frame
        frame.add(cardPanel);

        // Center the frame on the screen
        frame.setLocationRelativeTo(null);

        // Make the frame visible
        frame.setVisible(true);
    }
}