package Egresado;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.table.DefaultTableModel;

import Functions.UsersSesions;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Registro extends JPanel {
    private JTable table;
    private DefaultTableModel tableModel;

    /**
     * Create the panel.
     */
    public Registro(UsersSesions userF) {
        setBackground(new Color(202, 228, 255));

        JButton btnRegistro = new    JButton("");
        btnRegistro.setBackground(Color.WHITE);
        btnRegistro.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // REGISTRAR
                int selectedRow = table.getSelectedRow();
                if (selectedRow != -1) { // Si hay una fila seleccionada
                    Object idEvento = tableModel.getValueAt(selectedRow, 0);
                    Object categoria = tableModel.getValueAt(selectedRow, 7); // 7 es el índice de la última columna
                    // Mostrar los valores obtenidos
                    System.out.println("ID evento seleccionado: " + idEvento);
                    System.out.println("Categoría seleccionada: " + categoria);

                    userF.registrarAsistenciaEgresado((int) idEvento, (String) categoria);
                } else {
                    // Si no hay fila seleccionada, mostrar un JOptionPane
                    JOptionPane.showMessageDialog(null, "No se ha seleccionado ninguna fila.", "Error",
                            JOptionPane.ERROR_MESSAGE);
                }

                
            }
        });
        btnRegistro.setIcon(new ImageIcon(getClass().getResource("/images/Egresados/BotonRegistrar.png")));

        table = new JTable();
        // Crear un modelo de tabla no editable
        tableModel = new DefaultTableModel(
                new Object[] { "ID evento", "Nombre", "Descripcion","Fecha", "Hora", "Lugar", "Temática", "Categoría" },
                0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; // Hacer todas las celdas no editables
            }
        };
        table.setModel(tableModel);

        JScrollPane scrollPane = new JScrollPane(table);

        JLabel lblNewLabel = new JLabel(
                "<html>Selecciona en la tabla uno de los eventos y haz click en el botón Registrar</html>");
        lblNewLabel.setFont(new Font("Arial Narrow", Font.PLAIN, 13));
        lblNewLabel.setBackground(Color.WHITE);

        JButton btnCargar = new JButton("");
        btnCargar.setBackground(Color.WHITE);
        btnCargar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // BUSCAR
                userF.Vista_eventos_egresado(tableModel);
            }
        });
        btnCargar.setIcon(new ImageIcon(getClass().getResource("/images/BotonBusqueda.png")));

        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.TRAILING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 493, Short.MAX_VALUE)
                                .addGap(18)
                                .addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
                                        .addComponent(btnRegistro, GroupLayout.PREFERRED_SIZE, 156,
                                                GroupLayout.PREFERRED_SIZE)
                                        .addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
                                                .addComponent(btnCargar, GroupLayout.PREFERRED_SIZE, 91,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 154,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addGap(22)));
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
                                        .addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 399, Short.MAX_VALUE)
                                        .addGroup(groupLayout.createSequentialGroup()
                                                .addComponent(btnCargar)
                                                .addPreferredGap(ComponentPlacement.RELATED, 205, Short.MAX_VALUE)
                                                .addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 60,
                                                        GroupLayout.PREFERRED_SIZE)
                                                .addGap(3)
                                                .addComponent(btnRegistro, GroupLayout.PREFERRED_SIZE, 70,
                                                        GroupLayout.PREFERRED_SIZE)))
                                .addGap(19)));
        setLayout(groupLayout);

        
    }
}
