package com.mycompany.sie_proyecto;

import javax.swing.*;
import java.awt.*;

public class SIE_PROYECTO {
    public static void main(String[] args) {
        // Create the frame
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
        LoginEmpresa loginEmpresa = new LoginEmpresa(cardPanel);
        LoginDirectivo loginDirectivo = new LoginDirectivo(cardPanel);
        mainDirectivo maindirectivo = new mainDirectivo(cardPanel);
        
        // Add both panels to card panel
        cardPanel.add(mainPanel, "mainPanel");
        cardPanel.add(loginEgresado, "loginEgresado");
        cardPanel.add(loginEmpresa, "loginEmpresa");
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