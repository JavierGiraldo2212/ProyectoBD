package com.mycompany.sie_proyecto;

import Functions.UsersSesions;
import javax.swing.*;
import java.awt.*;

public class SIE_PROYECTO {
    public static void main(String[] args) {
        // Create the frame
        UsersSesions userF = new UsersSesions();
        JFrame frame = new JFrame("Sistema de Información de Egresados");
        
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(1280, 720);
        frame.setLayout(new CardLayout());

        // Create a panel for the card layout
        JPanel cardPanel = new JPanel(new CardLayout());

        // Create the main panel with buttons
        MainPanel mainPanel = new MainPanel(cardPanel);

        // Create the login panel for "Egresados" and "Empresa"
        LoginEgresado loginEgresado = new LoginEgresado(cardPanel);
        
        
        
        // Create the login panel for "Empresa" and its mainPanel
        LoginEmpresa loginEmpresa = new LoginEmpresa(cardPanel, userF);
        MainEmpresa mainEmpresa = new MainEmpresa(cardPanel, userF);

        // Create the login panel for "Directivo" and its mainPanel
        LoginDirectivo loginDirectivo = new LoginDirectivo(cardPanel, userF);
        mainDirectivo maindirectivo = new mainDirectivo(cardPanel, userF);
        
        
        // Add all panels to card panel
        cardPanel.add(mainPanel, "mainPanel");
        cardPanel.add(loginEgresado, "loginEgresado");
        cardPanel.add(loginEmpresa, "loginEmpresa");
        cardPanel.add(loginDirectivo, "loginDirectivo");
        cardPanel.add(maindirectivo,"mainDirectivo");
        cardPanel.add(mainEmpresa,"mainEmpresa");
        // Add card panel to frame
        frame.add(cardPanel);

        // Center the frame on the screen
        frame.setLocationRelativeTo(null);

        // Make the frame visible
        frame.setVisible(true);
    }
}