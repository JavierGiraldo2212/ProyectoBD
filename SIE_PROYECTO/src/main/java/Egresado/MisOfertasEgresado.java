package Egresado;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.table.DefaultTableModel;

import Functions.UsersSesions;


import java.awt.BorderLayout;
import java.awt.CardLayout;


public class MisOfertasEgresado extends JPanel {

        private JTable table;
        private DefaultTableModel tableModel;

        public MisOfertasEgresado( JPanel cardPanel, UsersSesions userF) {
                setBackground(Color.WHITE);

                JPanel panelLateral = new JPanel();
                panelLateral.setBackground(Color.WHITE);

                JPanel panelAux = new JPanel();
                panelAux.setBackground(Color.WHITE);
                GroupLayout groupLayout = new GroupLayout(this);
                setLayout(groupLayout);

                JLabel lblTitulo = new JLabel("");
                lblTitulo.setIcon(new ImageIcon(
                                MisOfertasEgresado.class.getResource("/images/Egresados/LogoEgresados.png")));
                lblTitulo.setBackground(Color.WHITE);

                JLabel lblSubtitulo = new JLabel("MIS OFERTAS LABORALES");
                lblSubtitulo.setFont(new Font("Arial Black", Font.PLAIN, 27));
                lblSubtitulo.setHorizontalAlignment(SwingConstants.CENTER);

                JPanel panelTabla = new JPanel();
                panelTabla.setLayout(new BorderLayout());

                // Crear un modelo de tabla no editable
                tableModel = new DefaultTableModel(
                                new Object[] { "No Oferta", "Empresa", "Estado", "Salario", "Experiencia Requerida",
                                                "Area", "Tipo Contrato", "Telefono Contacto", "Correo",
                                                "Correo Responsable" },
                                0) {
                        @Override
                        public boolean isCellEditable(int row, int column) {
                                return false; // Hacer todas las celdas no editables
                        }
                };

                table = new JTable(tableModel);
                JScrollPane scrollPane = new JScrollPane(table);
                panelTabla.add(scrollPane, BorderLayout.CENTER);

                JButton btnBusqueda = new JButton("");
                btnBusqueda.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de búsqueda
                                userF.buscarOfertasPorEgresado(tableModel);
                        }
                });
                btnBusqueda.setIcon(new ImageIcon(MisOfertasEgresado.class.getResource("/images/BotonBusqueda.png")));
                btnBusqueda.setBackground(Color.WHITE);
                btnBusqueda.setBorderPainted(false);
                JButton btnBorrar = new JButton("");
                btnBorrar.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // ACCIÓN BORRAR
                                int selectedRow = table.getSelectedRow();
                                if (selectedRow != -1) {
                                        // Obtener el valor de la primera columna (índice 0) de la fila seleccionada
                                        Object firstColumnValue = table.getValueAt(selectedRow, 0);
                                        userF.eliminarAplicacionOferta((int) firstColumnValue);
                                        userF.buscarOfertasPorEgresado(tableModel);
                                }else{
                                        JOptionPane.showMessageDialog(null, "No se ha seleccionado ninguna fila.", "Error", JOptionPane.ERROR_MESSAGE);
                                }
                        }
                });
                btnBorrar.setIcon(
                                new ImageIcon(MisOfertasEgresado.class.getResource("/images/Egresados/BotonBorrar.png")));
                btnBorrar.setBackground(Color.WHITE);
                btnBorrar.setBorderPainted(false);

                GroupLayout gl_panelAux = new GroupLayout(panelAux);
                gl_panelAux.setHorizontalGroup(
                                gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelAux
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelAux
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(lblTitulo,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                600,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.RELATED,
                                                                                                                21,
                                                                                                                Short.MAX_VALUE)
                                                                                                .addComponent(lblSubtitulo,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                399,
                                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                                .addGroup(Alignment.TRAILING,
                                                                                                gl_panelAux.createSequentialGroup()
                                                                                                                .addComponent(panelTabla,
                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                857,
                                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                                .addPreferredGap(
                                                                                                                                ComponentPlacement.UNRELATED)
                                                                                                                .addGroup(gl_panelAux
                                                                                                                                .createParallelGroup(
                                                                                                                                                Alignment.TRAILING)
                                                                                                                                .addComponent(btnBusqueda,
                                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                                107,
                                                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                                                .addComponent(btnBorrar,
                                                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                                                153,
                                                                                                                                                Short.MAX_VALUE))))
                                                                .addContainerGap()));
                gl_panelAux.setVerticalGroup(
                                gl_panelAux.createParallelGroup(Alignment.LEADING)
                                                .addGroup(gl_panelAux.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelAux
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addComponent(lblTitulo,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                91,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(lblSubtitulo,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                72,
                                                                                                GroupLayout.PREFERRED_SIZE))
                                                                .addGap(18)
                                                                .addGroup(gl_panelAux
                                                                                .createParallelGroup(Alignment.LEADING)
                                                                                .addGroup(gl_panelAux
                                                                                                .createSequentialGroup()
                                                                                                .addComponent(btnBusqueda,
                                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                                53,
                                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                                .addPreferredGap(
                                                                                                                ComponentPlacement.RELATED,
                                                                                                                445,
                                                                                                                Short.MAX_VALUE)
                                                                                                .addComponent(btnBorrar))
                                                                                .addComponent(panelTabla,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                567, Short.MAX_VALUE))
                                                                .addContainerGap()));
                panelAux.setLayout(gl_panelAux);

                JLabel LogoEgresados = new JLabel("");
                LogoEgresados.setIcon(
                                new ImageIcon(MisOfertasEgresado.class.getResource("/images/logo_egresados_unal.png")));
                LogoEgresados.setBackground(Color.WHITE);

                JButton btnCerrarSesion = new JButton("");
                btnCerrarSesion.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de cerrar sesión
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                if (userF.logout())
                                        cl.show(cardPanel, "mainPanel");
                        }
                });
                btnCerrarSesion.setIcon(new ImageIcon(MisOfertasEgresado.class.getResource("/images/logout.png")));
                btnCerrarSesion.setBackground(Color.WHITE);
                btnCerrarSesion.setBorderPainted(false);

                JButton btnBack = new JButton("");
                btnBack.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent e) {
                                // Acción del botón de retroceso
                                CardLayout cl = (CardLayout) cardPanel.getLayout();
                                cl.show(cardPanel, "mainEgresado");
                        }
                });
                btnBack.setBackground(Color.WHITE);
                btnBack.setIcon(new ImageIcon(MisOfertasEgresado.class.getResource("/images/botonBack.png")));
                btnBack.setBorderPainted(false);
                GroupLayout gl_panelLateral = new GroupLayout(panelLateral);
                panelLateral.setLayout(gl_panelLateral);
                gl_panelLateral.setHorizontalGroup(
                                gl_panelLateral.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelLateral.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(gl_panelLateral.createParallelGroup(
                                                                                GroupLayout.Alignment.LEADING)
                                                                                .addComponent(btnCerrarSesion)
                                                                                .addComponent(btnBack,
                                                                                                GroupLayout.PREFERRED_SIZE,
                                                                                                123,
                                                                                                GroupLayout.PREFERRED_SIZE)
                                                                                .addComponent(LogoEgresados))
                                                                .addContainerGap(33, Short.MAX_VALUE)));
                gl_panelLateral.setVerticalGroup(
                                gl_panelLateral.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(gl_panelLateral.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(LogoEgresados)
                                                                .addGap(275)
                                                                .addComponent(btnBack, GroupLayout.PREFERRED_SIZE, 42,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED, 244,
                                                                                Short.MAX_VALUE)
                                                                .addComponent(btnCerrarSesion,
                                                                                GroupLayout.PREFERRED_SIZE, 35,
                                                                                GroupLayout.PREFERRED_SIZE)
                                                                .addGap(60)));

                // Configuración del diseño principal del panel
                groupLayout.setHorizontalGroup(
                                groupLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addComponent(panelLateral, GroupLayout.PREFERRED_SIZE,
                                                                                214, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(ComponentPlacement.RELATED)
                                                                .addComponent(panelAux, GroupLayout.DEFAULT_SIZE,
                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                Short.MAX_VALUE)
                                                                .addContainerGap()));
                groupLayout.setVerticalGroup(
                                groupLayout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                .addGroup(groupLayout.createSequentialGroup()
                                                                .addContainerGap()
                                                                .addGroup(groupLayout.createParallelGroup(
                                                                                GroupLayout.Alignment.TRAILING)
                                                                                .addComponent(panelAux,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                Short.MAX_VALUE)
                                                                                .addComponent(panelLateral,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                GroupLayout.DEFAULT_SIZE,
                                                                                                Short.MAX_VALUE))
                                                                .addContainerGap()));
        }
}
