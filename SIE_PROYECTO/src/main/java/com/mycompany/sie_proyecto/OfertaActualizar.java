package com.mycompany.sie_proyecto;

import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JTextField;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class OfertaActualizar extends JPanel {
    private JTextField textNoOferta;

    /**
     * Create the panel.
     */
    public OfertaActualizar() {
        setBackground(Color.WHITE);

        JPanel panelAux = new JPanel();
        panelAux.setBackground(Color.WHITE);
        GroupLayout groupLayout = new GroupLayout(this);
        JLabel Titulo = new JLabel("");
        Titulo.setIcon(new ImageIcon(UseEmpresa.class.getResource("/images/ofertaLaboral.png")));
        Titulo.setBackground(Color.WHITE);

        // Create the form components
        JLabel lblEstado = new JLabel("Estado:");
        lblEstado.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtEstado = new JTextField();
        txtEstado.setColumns(20);

        JLabel lblSalario = new JLabel("Salario:");
        lblSalario.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtSalario = new JTextField();
        txtSalario.setColumns(20);

        JLabel lblExpRequerida = new JLabel("ExpRequerida:");
        lblExpRequerida.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtExpRequerida = new JTextField();
        txtExpRequerida.setColumns(20);

        JLabel lblArea = new JLabel("Area:");
        lblArea.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtArea = new JTextField();
        txtArea.setColumns(20);

        JLabel lblTipoContrato = new JLabel("TipoContrato:");
        lblTipoContrato.setFont(new Font("Arial Black", Font.PLAIN, 17));
        JTextField txtTipoContrato = new JTextField();
        txtTipoContrato.setColumns(20);

        JButton btnUpdateOffer = new JButton("");
        btnUpdateOffer.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // CREAR OFERTA
            }
        });
        btnUpdateOffer.setIcon(new ImageIcon(OfertaCrear.class.getResource("/images/Update.png")));
        btnUpdateOffer.setBackground(Color.WHITE);

        JLabel lblNoferta = new JLabel("No Oferta:\\n" + //
                                "(obligatorio)");
        lblNoferta.setFont(new Font("Arial Black", Font.PLAIN, 17));

        textNoOferta = new JTextField();
        textNoOferta.setColumns(20);

        GroupLayout gl_panelAux = new GroupLayout(panelAux);
        gl_panelAux.setHorizontalGroup(
                gl_panelAux.createParallelGroup(Alignment.TRAILING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(269, Short.MAX_VALUE)
                                .addComponent(Titulo, GroupLayout.PREFERRED_SIZE, 518, GroupLayout.PREFERRED_SIZE)
                                .addGap(258))
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap(819, Short.MAX_VALUE)
                                .addComponent(btnUpdateOffer, GroupLayout.PREFERRED_SIZE, 164,
                                        GroupLayout.PREFERRED_SIZE)
                                .addGap(62))
                        .addGroup(Alignment.LEADING, gl_panelAux.createSequentialGroup()
                                .addGap(237)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addComponent(lblNoferta, GroupLayout.PREFERRED_SIZE, 109,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(77)
                                                .addComponent(textNoOferta, GroupLayout.PREFERRED_SIZE, 303,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addContainerGap())
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(lblEstado)
                                                        .addComponent(lblSalario)
                                                        .addComponent(lblExpRequerida)
                                                        .addComponent(lblArea)
                                                        .addComponent(lblTipoContrato))
                                                .addGap(53)
                                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                        .addComponent(txtEstado, GroupLayout.DEFAULT_SIZE, 303,
                                                                Short.MAX_VALUE)
                                                        .addComponent(txtSalario, 303, 303, 303)
                                                        .addComponent(txtExpRequerida, 303, 303, 303)
                                                        .addComponent(txtArea, 303, 303, 303)
                                                        .addComponent(txtTipoContrato, 303, 303, 303))
                                                .addGap(319)))));
        gl_panelAux.setVerticalGroup(
                gl_panelAux.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelAux.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(Titulo)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.LEADING)
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(44)
                                                .addComponent(textNoOferta, GroupLayout.PREFERRED_SIZE, 25,
                                                        GroupLayout.PREFERRED_SIZE))
                                        .addGroup(gl_panelAux.createSequentialGroup()
                                                .addGap(41)
                                                .addComponent(lblNoferta, GroupLayout.PREFERRED_SIZE, 25,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblEstado)
                                        .addComponent(txtEstado, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblSalario)
                                        .addComponent(txtSalario, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblExpRequerida)
                                        .addComponent(txtExpRequerida, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblArea)
                                        .addComponent(txtArea, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(18)
                                .addGroup(gl_panelAux.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(lblTipoContrato)
                                        .addComponent(txtTipoContrato, GroupLayout.PREFERRED_SIZE, 25,
                                                GroupLayout.PREFERRED_SIZE))
                                .addGap(139)
                                .addComponent(btnUpdateOffer)
                                .addContainerGap(51, Short.MAX_VALUE)));
        panelAux.setLayout(gl_panelAux);

        GroupLayout layout = new GroupLayout(this);
        layout.setHorizontalGroup(
                layout.createParallelGroup(Alignment.LEADING)
                        .addComponent(panelAux, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                Short.MAX_VALUE));
        layout.setVerticalGroup(
                layout.createParallelGroup(Alignment.LEADING)
                        .addComponent(panelAux, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE,
                                Short.MAX_VALUE));
        this.setLayout(layout);
    }
}
