package Functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import com.mysql.cj.jdbc.CallableStatement;


public class UsersSesions {
    public String name = "";
    private static final String bd = "Proyecto_BD";
    private static final String host = "localhost";
    private static final String server = "jdbc:mysql://" + host + "/" + bd
            + "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    public Connection connection;

    public boolean login(String user, String password, String requiredRole) {
        name = user;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(server, user, password);
            System.out.println("Conexión a base de datos " + bd + " ... OK");

            String roles = getUserRoles(connection, user);
            if (roles != null && !roles.isEmpty()) {
                System.out.println("Los roles del usuario " + user + " son: " + roles);
                if (roles.contains(requiredRole)) {
                    return true;
                } else {
                    JOptionPane.showMessageDialog(null,
                            "El usuario " + user + " no tiene el rol requerido: " + requiredRole,
                            "Error de autorización", JOptionPane.ERROR_MESSAGE);
                    connection.close();
                    return false;
                }
            } else {
                JOptionPane.showMessageDialog(null, "No se pudieron encontrar los roles del usuario " + user,
                        "Error de autorización", JOptionPane.ERROR_MESSAGE);
                connection.close();
                return false;
            }
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Error cargando el Driver MySQL JDBC", "Error",
                    JOptionPane.ERROR_MESSAGE);
            return false;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Imposible realizar conexión con " + bd, "Error",
                    JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    private String getUserRoles(Connection connection, String username) {
        StringBuilder roles = new StringBuilder();
        String patternString = "GRANT\\s+((?:`[^`]+`@`[^`]+`,?\\s*)+)\\s+TO\\s+`[^`]+`@`localhost`";
        Pattern pattern = Pattern.compile(patternString);

        try (Statement stmt = connection.createStatement()) {
            String query = "SHOW GRANTS FOR '" + username + "'@'localhost'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                System.out.println(rs.getString(1));
                String grant = rs.getString(1);
                Matcher matcher = pattern.matcher(grant);
                if (matcher.find()) {
                    if (roles.length() > 0) {
                        roles.append(", ");
                    }
                    roles.append(matcher.group(1));
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error obteniendo los roles del usuario", "Error",
                    JOptionPane.ERROR_MESSAGE);
            return null;
        }
        return roles.toString();
    }

    public boolean logout() {
        try {
            if (connection != null && !connection.isClosed()) {
                System.out.println(this.name);
                connection.close();
                System.out.println("Conexión cerrada.");
                name = "";
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error cerrando la conexión", "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            connection = null;
        }
        return false;
    }
    
    public Connection getConnection() {
        if (this.connection == null) {
            System.err.println("Conexión no establecida. Devuelve null.");
        }
        return this.connection;
    }
    // Métodos EGRESADOS
    
    // Modificar el método Vista_OfertasLaborales para soportar filtrado múltiple
    public void Vista_OfertasLaboralesFiltrado(DefaultTableModel model, String filtroEmpresa, String filtroEstado, String filtroArea) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = this.connection; // Obtener la conexión establecida
        
        // Consulta SQL base
        String sql = "SELECT * FROM vw_ofertas_laborales WHERE 1=1";

        // Lista para almacenar los parámetros de filtro
        List<Object> params = new ArrayList<>();

        // Construir consulta dinámica con filtros
        if (!filtroEmpresa.isEmpty()) {
            sql += " AND Empresa LIKE ?";
            params.add("%" + filtroEmpresa + "%");
        }
        if (!filtroEstado.isEmpty()) {
            sql += " AND Estado LIKE ?";
            params.add("%" + filtroEstado + "%");
        }
        if (!filtroArea.isEmpty()) {
            sql += " AND Area LIKE ?";
            params.add("%" + filtroArea + "%");
        }

        // Preparar la declaración con la consulta final
        stmt = conn.prepareStatement(sql);

        // Asignar parámetros a la declaración preparada
        for (int i = 0; i < params.size(); i++) {
            stmt.setObject(i + 1, params.get(i));
        }

        rs = stmt.executeQuery(); // Ejecutar la consulta

        // Limpiar el modelo de la tabla antes de agregar nuevas filas
        model.setRowCount(0);

        // Procesar los resultados y añadir filas al modelo de la tabla
        while (rs.next()) {
            int noOferta = rs.getInt("No Oferta");
            String empresa = rs.getString("Empresa");
            String estado = rs.getString("Estado");
            double salario = rs.getDouble("Salario");
            String experienciaRequerida = rs.getString("Experiencia requerida");
            String area = rs.getString("Area");
            String tipoContrato = rs.getString("Tipo contrato");
            String telefonoContacto = rs.getString("Telefono contacto");
            String correo = rs.getString("Correo");
            String correoResponsable = rs.getString("Correo responsable");

            Object[] row = { noOferta, empresa, estado, salario, experienciaRequerida, area, tipoContrato,
                    telefonoContacto, correo, correoResponsable };

            model.addRow(row); // Agregar cada fila al modelo de la tabla
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejar excepciones SQL
    } finally {
        // Cerrar los recursos
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            // No cerrar la conexión aquí, para poder reutilizarla
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones al cerrar recursos
        }
    }
}

    // Aplicar oferta laboral
    public String aplicarOfertaLaboral(int noOfertaLaboral) {
    String resultado = "";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String correoElectronico = this.name;

    try {
        conn = this.connection; // Obtener la conexión establecida

        String sql = "{CALL AplicarOfertaLaboral(?, ?)}"; // Llamada al procedimiento almacenado
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, correoElectronico);
        stmt.setInt(2, noOfertaLaboral);

        rs = stmt.executeQuery(); // Ejecutar la consulta

        if (rs.next()) {
            resultado = rs.getString(1); // Obtener el resultado del procedimiento
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejar excepciones SQL
        resultado = "Error al aplicar a la oferta laboral.";
    } finally {
        // Cerrar los recursos
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            // No cerrar la conexión aquí, para poder reutilizarla
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones al cerrar recursos
        }
    }

    // Mostrar una alerta con el resultado
    JOptionPane.showMessageDialog(null, resultado, "Resultado de la Postulación", JOptionPane.INFORMATION_MESSAGE);

    return resultado; // Devolver el resultado del procedimiento
}

    // Información personal del egresado
    public Map<String, Object> obtenerDatosEgresado() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Map<String, Object> datosEgresado = new HashMap<>();

        try {
            conn = this.connection; // Obtener la conexión establecida
            String correo = this.name;
            String sql = "{CALL p_obtener_datos_egresado(?)}"; // Llamada al procedimiento almacenado
            stmt = conn.prepareCall(sql);
            stmt.setString(1, correo);

            rs = stmt.executeQuery(); // Ejecutar la consulta

            // Procesar el ResultSet
            if (rs.next()) {
                // Obtener los datos del ResultSet y guardarlos en el mapa
                datosEgresado.put("Cedula", rs.getLong("Cedula"));
                datosEgresado.put("FACULTAD_idFACULTAD", rs.getInt("FACULTAD_idFACULTAD"));
                datosEgresado.put("Nombre", rs.getString("Nombre"));
                datosEgresado.put("PrimerApellido", rs.getString("PrimerApellido"));
                datosEgresado.put("SegundoApellido", rs.getString("SegundoApellido"));
                datosEgresado.put("Direccion", rs.getString("Direccion"));
                datosEgresado.put("Ciudad", rs.getString("Ciudad"));
                datosEgresado.put("Pais", rs.getString("Pais"));
                datosEgresado.put("CorreoElectronico", rs.getString("CorreoElectronico"));
                datosEgresado.put("GrupoEtnico", rs.getString("GrupoEtnico"));
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }

        return datosEgresado;
    }

    // Actualizar datos de un egresado 
    public int actualizarDatosEgresado(String nombre, String primerApellido,
            String segundoApellido, String direccion, String ciudad, String pais) {
        
        Connection conn = null;
        CallableStatement stmt = null;
        int rowsUpdated = 0;
        String correoElectronico = this.name;

        try {
            conn = this.connection; // Obtener la conexión establecida
            String sql = "{CALL p_actualizar_datos_egresado_from_egreesado(?, ?, ?, ?, ?, ?, ?)}";
            
            stmt = (CallableStatement) conn.prepareCall(sql);
            stmt.setString(1, correoElectronico);
            stmt.setString(2, nombre);
            stmt.setString(3, primerApellido);
            stmt.setString(4, segundoApellido);
            stmt.setString(5, direccion);
            stmt.setString(6, ciudad);
            stmt.setString(7, pais);

            rowsUpdated = stmt.executeUpdate(); // Ejecutar y obtener filas actualizadas

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }

        return rowsUpdated;
    }   

    // Mostrar las charlas en la tabla
    public void Vista_eventos_egresado(DefaultTableModel model) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = this.connection; // Obtener la conexión establecida

        // Consulta SQL para seleccionar los datos de la vista Combined_View
        String sql = "SELECT * FROM Proyecto_BD.Combined_View";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery(); // Ejecutar la consulta

        // Limpiar el modelo de la tabla antes de agregar nuevas filas
        model.setRowCount(0);

        // Procesar los resultados y añadir filas al modelo de la tabla
        while (rs.next()) {
            int eventoID = rs.getInt("EVENTO_ID");
            String eventoNombre = rs.getString("Evento_Nombre");
            String eventoDescripcion = rs.getString("Evento_Descripcion");
            Date eventoFecha = rs.getDate("Evento_Fecha");
            Time eventoHora = rs.getTime("Evento_Hora");
            String eventoLugar = rs.getString("Evento_Lugar");
            String tematica = rs.getString("Tematica");
            String tipoEvento = rs.getString("Tipo_evento");

            // Crear un objeto que contenga los datos que deseas mostrar
            Object[] row = { eventoID, eventoNombre, eventoDescripcion, eventoFecha, eventoHora, eventoLugar, tematica, tipoEvento };
            model.addRow(row); // Agregar cada fila al modelo de la tabla
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejar excepciones SQL
    } finally {
        // Cerrar los recursos
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            // No cerrar la conexión aquí, para poder reutilizarla
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones al cerrar recursos
        }
    }
}

    // Método para registrar la asistencia de un egresado a un evento
    public void registrarAsistenciaEgresado(int eventoId, String tipoEvento) {
        Connection conn = null;
        CallableStatement stmt = null;
        String correo = this.name;
        try {
            conn = this.connection; // Obtener la conexión establecida

            String sql = "{CALL Registrar_Asistencia_Egresado(?, ?, ?)}"; // Llamada al procedimiento almacenado
            stmt = (CallableStatement) conn.prepareCall(sql);
            stmt.setString(1, correo);
            stmt.setInt(2, eventoId);
            stmt.setString(3, tipoEvento);

            stmt.execute(); // Ejecutar la llamada al procedimiento

            // Mostrar un mensaje de éxito
            JOptionPane.showMessageDialog(null, "Asistencia registrada correctamente", "Resultado",
                    JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException e) {
            // Mostrar un mensaje de error en caso de excepción SQL
            JOptionPane.showMessageDialog(null, "Error al registrar asistencia: " + e.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
            e.printStackTrace(); // Imprimir el stack trace para depuración
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }

    // Método para eliminar la asistencia de un egresado a un evento
    public void eliminarAsistenciaEgresado(int eventoId, String tipoEvento) {
        Connection conn = null;
        CallableStatement stmt = null;
        String correo = this.name;
        try {
            conn = this.connection; // Obtener la conexión establecida

            String sql = "{CALL Eliminar_Asistencia_Egresado(?, ?, ?)}"; // Llamada al procedimiento almacenado
            stmt = (CallableStatement) conn.prepareCall(sql);
            stmt.setString(1, correo);
            stmt.setInt(2, eventoId);
            stmt.setString(3, tipoEvento);

            stmt.execute(); // Ejecutar la llamada al procedimiento

            // Mostrar un mensaje de éxito
            JOptionPane.showMessageDialog(null, "Asistencia eliminada correctamente", "Resultado",
                    JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException e) {
            // Mostrar un mensaje de error en caso de excepción SQL
            JOptionPane.showMessageDialog(null, "Error al eliminar asistencia: " + e.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
            e.printStackTrace(); // Imprimir el stack trace para depuración
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }

    // Método para ver los eventos a los que está inscrito un egresado
    public void Ver_Eventos_Egresado(DefaultTableModel model) {
        Connection conn = null;
        java.sql.CallableStatement cstmt = null;
        ResultSet rs = null;
        String correo = this.name; // Asumiendo que `this.name` contiene el correo del egresado

        try {
            conn = this.connection; // Obtener la conexión establecida

            // Llamada al procedimiento almacenado BuscarEventosPorEgresado
            String sql = "{CALL BuscarEventosPorEgresado(?)}";
            cstmt = conn.prepareCall(sql);
            cstmt.setString(1, correo); // Establecer el parámetro de entrada correo

            boolean results = cstmt.execute();

            // Limpiar el modelo de la tabla antes de agregar nuevas filas
            model.setRowCount(0);

            // Procesar los resultados
            while (results) {
                rs = cstmt.getResultSet();
                while (rs.next()) {
                    int eventoID = rs.getInt("ID_Evento");
                    String eventoNombre = rs.getString("Nombre");
                    String eventoDescripcion = rs.getString("Descripcion");
                    Date eventoFecha = rs.getDate("Fecha");
                    Time eventoHora = rs.getTime("Hora");
                    String eventoLugar = rs.getString("Lugar");
                    String tematica = rs.getString("Tematica");
                    String tipoEvento = rs.getString("Tipo_evento");

                    // Crear un objeto que contenga los datos que deseas mostrar
                    Object[] row = { eventoID, eventoNombre, eventoDescripcion, eventoFecha, eventoHora, eventoLugar,
                            tematica, tipoEvento };
                    model.addRow(row); // Agregar cada fila al modelo de la tabla
                }
                results = cstmt.getMoreResults(); // Verificar si hay más resultados disponibles
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (rs != null)
                    rs.close();
                if (cstmt != null)
                    cstmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }

    // Método para ver las ofertas a las que a aplicado un egresado
    public void buscarOfertasPorEgresado(DefaultTableModel model) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

         String correoEgresado = this.name;

        try {
            conn = this.connection; // Obtener la conexión establecida

            // Llamada al procedimiento almacenado
            String sql = "{ CALL sp_buscar_ofertas_por_egresado(?) }";

            // Preparar la declaración con el procedimiento almacenado
            stmt = conn.prepareCall(sql);
            stmt.setString(1, correoEgresado); // Asignar parámetro de entrada del procedimiento

            rs = stmt.executeQuery(); // Ejecutar el procedimiento almacenado

            // Limpiar el modelo de la tabla antes de agregar nuevas filas
            model.setRowCount(0);

            // Procesar los resultados y añadir filas al modelo de la tabla
            while (rs.next()) {
                int noOferta = rs.getInt("No Oferta");
                String empresa = rs.getString("Empresa");
                String estado = rs.getString("Estado");
                double salario = rs.getDouble("Salario");
                String experienciaRequerida = rs.getString("Experiencia requerida");
                String area = rs.getString("Area");
                String tipoContrato = rs.getString("Tipo contrato");
                String telefonoContacto = rs.getString("Telefono contacto");
                String correoEmpresa = rs.getString("Correo");
                String correoResponsable = rs.getString("Correo responsable");

                Object[] row = { noOferta, empresa, estado, salario, experienciaRequerida, area, tipoContrato,
                        telefonoContacto, correoEmpresa, correoResponsable };

                model.addRow(row); // Agregar cada fila al modelo de la tabla
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }

    // Método para eliiminar una oferta a ls que a aplicadó un egresado
    public void eliminarAplicacionOferta(int idOferta) {
        Connection conn = null;
        java.sql.CallableStatement stmt = null;
        String correo = this.name;

        try {
            conn = this.connection; // Obtener la conexión establecida

            // Llamar al procedimiento almacenado
            String sql = "{CALL sp_eliminar_aplicacion_oferta(?, ?)}";
            stmt = conn.prepareCall(sql);

            // Establecer los parámetros del procedimiento almacenado
            stmt.setString(1, correo);
            stmt.setInt(2, idOferta);

            stmt.execute(); // Ejecutar el procedimiento almacenado

            System.out.println("Aplicación eliminada correctamente para correo: " + correo + " y oferta: " + idOferta);

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar excepciones SQL
        } finally {
            // Cerrar los recursos
            try {
                if (stmt != null)
                    stmt.close();
                // No cerrar la conexión aquí, para poder reutilizarla
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar excepciones al cerrar recursos
            }
        }
    }
    
}