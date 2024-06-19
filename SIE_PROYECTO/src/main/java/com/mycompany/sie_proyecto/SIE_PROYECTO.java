package com.mycompany.sie_proyecto;

import Functions.UsersSesions;
import javax.swing.*;
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

        // Create the login panel for "Egresados" and its mainPanel
        LoginEgresado loginEgresado = new LoginEgresado(cardPanel,userF);
        MainEgresados mainEgresados = new MainEgresados(cardPanel, userF);
        EgresadosDatos egresadosDatos = new EgresadosDatos(cardPanel, userF);
        ofertasEgresados ofertas_egresados = new ofertasEgresados(cardPanel, userF);
        
        // Create the login panel for "Empresa" and its mainPanel
        LoginEmpresa loginEmpresa = new LoginEmpresa(cardPanel, userF);
        MainEmpresa mainEmpresa = new MainEmpresa(cardPanel, userF);
        UseEmpresa useEmpresa = new UseEmpresa(cardPanel, userF);
        EmpresaOferta empresaOferta = new EmpresaOferta(cardPanel, userF);

        // Create the login panel for "Directivo" and its mainPanel
        LoginDirectivo loginDirectivo = new LoginDirectivo(cardPanel, userF);
        mainDirectivo maindirectivo = new mainDirectivo(cardPanel, userF);
        
        
        // Add all panels to card panel
        cardPanel.add(mainPanel, "mainPanel");

        cardPanel.add(loginEgresado, "loginEgresado");
        cardPanel.add(mainEgresados, "mainEgresado");
        cardPanel.add(egresadosDatos,"egresadosDatos");
        cardPanel.add(ofertas_egresados, "egresadosOferta");

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