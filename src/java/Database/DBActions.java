package Database;

import static Database.MD5.toMD5;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import xml.MakersXML;

public class DBActions {
    
    public static String getCountDepartamento(String depart){
        String res = "NOP";
        DBConnection con = new DBConnection();
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            ResultSet rs = st.executeQuery("select count(*) from dept_emp where dept_no='"+depart+"';");
            rs.next();
            res = Integer.toString(rs.getInt(1));
            res = (new MakersXML()).xmlCountDepartamento(res);
        } catch (SQLException ex) {
        } finally {
            con.close();
        }
        return res;
    }
    
    public static String getResponseLog(String user, String pass) {
        DBConnection con = new DBConnection();
        String aux = "-1";
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            ResultSet rs = st.executeQuery("select nivel from e_usuarios "
                    + "where e_usuarios.usuario=" + "\"" + user + "\""
                    + " AND e_usuarios.clave=" + "\"" + toMD5(pass) + "\"" + ";");
            while (rs.next()) {
                aux = rs.getString("nivel");
            }
        } catch (SQLException ex) {
            ex.toString();
        } finally {
            con.close();
        }
        return aux;
    }
    
    public String getNumEmployees() {
        String res = "NOP";
        DBConnection con = new DBConnection();
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            ResultSet rs = st.executeQuery("select count(*) from employees;");
            rs.next();
            res = Integer.toString(rs.getInt(1));
            res = (new MakersXML()).xmlNumEmpleados(res);
        } catch (SQLException ex) {
        } finally {
            con.close();
        }
        return res;
    }

    public String getEmp(int i) {
        String res = "";
        DBConnection con = new DBConnection();
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            ResultSet rs = st.executeQuery("select * from employees;");
            rs.absolute(i);
            String[] aux = new String[6];
            aux[0] = Integer.toString(rs.getInt("emp_no"));
            aux[1] = (rs.getDate("birth_date")).toString();
            aux[2] = rs.getString("first_name");
            aux[3] = rs.getString("last_name");
            aux[4] = rs.getString("gender");
            aux[5] = (rs.getDate("hire_date")).toString();
            res = (new MakersXML()).xmlEmpleado(aux);
        } catch (SQLException ex) {
        } finally {
            con.close();
        }
        return res;
    }

    public String getEmps(int i, int j) {
        ArrayList<String> res = new ArrayList<>();
        DBConnection con = new DBConnection();
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            ResultSet rs = st.executeQuery("select * from employees;");
            rs.absolute(i);
            int vaux = i + j;
            while (i < (vaux - 1)) {
                String[] aux = new String[6];
                aux[0] = Integer.toString(rs.getInt("emp_no"));
                aux[1] = (rs.getDate("birth_date")).toString();
                aux[2] = rs.getString("first_name");
                aux[3] = rs.getString("last_name");
                aux[4] = rs.getString("gender");
                aux[5] = (rs.getDate("hire_date")).toString();
                res.add((new MakersXML()).xmlEmpleadoSimple(aux));
                rs.next();
                i++;
            }
            String[] aux = new String[6];
            aux[0] = Integer.toString(rs.getInt("emp_no"));
            aux[1] = (rs.getDate("birth_date")).toString();
            aux[2] = rs.getString("first_name");
            aux[3] = rs.getString("last_name");
            aux[4] = rs.getString("gender");
            aux[5] = (rs.getDate("hire_date")).toString();
            res.add((new MakersXML()).xmlEmpleadoSimple(aux));
        } catch (SQLException ex) {
        } finally {
            con.close();
        }
        return (new MakersXML()).xmlNEmpleados(res);
    }

    public String getSalaryEmploy(int emp_no) {
        ArrayList<String> res = new ArrayList<>();
        DBConnection con = new DBConnection();
        try {
            con.open();
            Statement st = con.getConection().createStatement();
            String sql = "select * from salaries where emp_no = " + emp_no+ ";";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                res.add(Integer.toString(rs.getInt("salary")));
                res.add(rs.getDate("from_date").toString());
                res.add(rs.getDate("to_date").toString());
            }
        } catch (SQLException ex) {
        } finally {
            con.close();
        }
        return (new MakersXML()).xmlSalaryEmploy(emp_no, res);
    }
    
}
