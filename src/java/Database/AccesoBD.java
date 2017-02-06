package Database;

import java.io.Serializable;

public class AccesoBD implements Serializable {
        
    public String getNumEmpleados() {
        DBActions dba = new DBActions();
         return dba.getNumEmployees();
    }
    
    public String getEmpleado(int i) {
        DBActions dba = new DBActions();
        String res = dba.getEmp(i);
        return res;
    }    
    
    public String getEmpleados(int i, int j) {
        DBActions dba = new DBActions();
        String res = dba.getEmps(i, j);
        return res;
    }    
    
    public String getSalarioEmpleado(int i) {
        DBActions dba = new DBActions();
        String res = dba.getSalaryEmploy(i);
        return res;
    }    
}
